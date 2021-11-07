; /// @file ls-boot-loader/mbr.asm
; /// @brief 我们自己的MBR, 加上可以更换的分区表信息, 载入我们自己的连续扇区到内存
; /// @note 编译命令行 
; /// 	cd D:\prj\nasm_prj\boot\ls-boot-loader
; /// 	d:
; ///	C:\nasm\nasm.exe mbr.asm -o mbr.bin -l mbr.list
; /// @note 将 mbr.bin 写到U盘0扇区
; ///	MBR代码空间很紧张, 不是"一定需要堆栈平衡的call", 可以不进行call之后的堆栈平衡操作, 等跳到BOOT代码, 再重新设置栈顶

; /// 标识符命名约定
; /// label_x 为标签, 供跳转指令使用
; /// addr_x 为地址, 供内存操作指令使用
; /// byte_x word_x 为全局变量, 供程序流程内使用, 在使用前需要初始化
; /// fn_x 为函数入口地址, 供 call 指令使用
; /// XXX 为宏, 必须全大写, 单词之间用'_'连接

; /// 宏命名约定
; /// SWITCH_X 编译用的开关, 发行前, 必须注释掉
; /// MEMORY_ADDR_X 内存地址
; /// SECTOR_INDEX_X 扇区索引
; /// SECTOR_BLOCK_SIZE_ 扇区索引对应的连续扇区块数
; /// CNT_X 数量
; /// BYTE_FLAG_X 特定标志的值, e.g. 激活 = 0x80
; /// LEN_X 长度
; /// BIT_VALID_X 位标志字节值定义
; /// STACK_IN_PARAM_X 入参, 以bp为参照点
; /// STACK_OUT_PARAM_X 出参, 以si为参照点

;--------------------------------------------------------------------------------
; /// 宏定义
;--------------------------------------------------------------------------------
; /// 如果没定义 SWITCH_USE_CHS_READ_SECTOR_TO_MEMORY, 就优先执行 int 13h ah = 42h, 扩展读扇区到内存, 
; /// 如果失败, 才执行int 13h ah = 2h, 根据CHS读扇区到内存
; /// 等调试完成, 请注释掉 SWITCH_USE_CHS_READ_SECTOR_TO_MEMORY
; %define SWITCH_USE_CHS_READ_SECTOR_TO_MEMORY ; ///< 使用 int 13h ah = 2h 的CHS接口读扇区到内存
%define SWITCH_WHEN_MBR_END_LOOP_DEAD ; ///< MBR程序结束后, 不跳到已经载入到内存的扇区, 在本地死循环, 用于调试

MEMORY_ADDR_BOOT_CODE_ORG_ENTRY equ 0x7c00 ; ///< MBR程序入口地址
MEMORY_ADDDR_LOADER_MODULE equ 0x7e00; ///< "载入"模块地址

; /// 在实验U盘上，找到的没有被使用的U盘连续扇区索引范围(14~3229, 3231~17999)
; /// 实验过程 : http://blog.csdn.net/lostspeed/article/details/48804455
; /// 14~3229扇区足够我们做实验了
; /// 0x9f000以上是 Extended BIOS data Area(1~4K, usually 1K), 最多只能到0x9ee00开始, 0x9ee00 ~ 0x9f000
; /// int 13h, ah = 42h时，能读的扇区数最大为127(0x7f)个
; /// 02h    WORD    number of blocks to transfer (max 007Fh for Phoenix EDD)
; /// int 13h, ah = 2h时, 能读取的扇区最大值，没有特别说明，为了兼容 ah = 42h, 将BOOT连续扇区最大块数最大可能定为127

; /// 一个段size = 64KB = 0xffff, 有128个扇区
SECTOR_BLOCK_SIZE_MAX_BY_BIOS_COPY equ ((0xFE00 - MEMORY_ADDDR_LOADER_MODULE) / 0x200) ; ///< 用BIOS接口一次能拷贝的最大扇区块数(64)

DISK_SECTOR_INDEX_BOOT_CODE equ 14 ; ///< 在物理磁盘上, BOOT代码所在的起始扇区
SECTOR_BLOCK_SIZE_BOOT_CODE_SEG_LIMIT equ (SECTOR_BLOCK_SIZE_MAX_BY_BIOS_COPY - DISK_SECTOR_INDEX_BOOT_CODE) ; ///< BOOT代码在0段的连续扇区最大块数(50), 可容纳25600字节(25KB二进制代码)

DISK_SECTOR_INDEX_BOOT_CODE_LAST equ (DISK_SECTOR_INDEX_BOOT_CODE + SECTOR_BLOCK_SIZE_BOOT_CODE_SEG_LIMIT - 1) ; ///< 在物理磁盘上, BOOT代码所在的结束扇区, 63

; /// 0x7e00
MEMORY_ADDR_SECTOR_NEED_COPY_TO_DEST equ MEMORY_ADDDR_LOADER_MODULE ; ///< 新扇区要拷贝到的内存地址

; /// 0xe000
MEMORY_ADDR_SECTOR_NEED_COPY_TO_DEST_LAST equ (MEMORY_ADDR_SECTOR_NEED_COPY_TO_DEST + 512 * (SECTOR_BLOCK_SIZE_BOOT_CODE_SEG_LIMIT - 1)); ///< 新扇区要拷贝到的内存地址最后一个扇区的起始地址

; /// 0x1c00
DISK_ADDR_SECTOR_NEED_COPY_TO_DEST equ (512 * 14); ///< 新扇区要拷贝的磁盘地址开始扇区的起始地址

; /// 0x7e00
DISK_ADDR_SECTOR_NEED_COPY_TO_DEST_LAST equ (512 * (14 + SECTOR_BLOCK_SIZE_BOOT_CODE_SEG_LIMIT - 1)); ///< 新扇区要拷贝的磁盘地址结束扇区的起始地址
	
MEMORY_ADDR_STACK_TOP equ 0x7c00 ; ///< 栈顶地址

CNT_PARTITION_ENTRY equ 4 ; ///< 分区表入口总数量

BYTE_FLAG_PARTITION_ACTIVE equ 0x80 ; ///< 分区激活标志字节内容
LEN_PARTITION_ENTRY equ 0x10 ; ///< 分区表入口长度为16Bytes

; /// byte_status字节状态位定义

; /// 状态位 : 磁盘安装检查(DISK INSTALLATION CHECK). 1 = 已安装, 0 = 未安装
BIT_VALID_DISK_INSTALLATION_CHECK_SET equ 00000001b ; ///< 设置DISK_INSTALLATION_CHECK-有效位标志, 用OR方法, TEST位时，也用这个值
BIT_VALID_DISK_INSTALLATION_CHECK_CLR equ 11111110b ; ///< 清除DISK_INSTALLATION_CHECK-有效位标志, 用AND方法

BIT_VALID_MAX_CHS_SET equ 00000010b ; ///< 已经得到磁盘的最大CHS-有效位标志, 用OR方法, TEST位时，也用这个值
BIT_VALID_MAX_CHS_CLR equ 11111101b ; ///< 已经得到磁盘的最大CHS-有效位标志, 用AND方法

; 栈入参 - 以函数入口处的bp为基准
%define STACK_IN_PARAM_1 [bp + 2]
%define STACK_IN_PARAM_2 [bp + 4]
%define STACK_IN_PARAM_3 [bp + 6]
%define STACK_IN_PARAM_4 [bp + 8]
%define STACK_IN_PARAM_5 [bp + 10]
%define STACK_IN_PARAM_6 [bp + 12]
%define STACK_IN_PARAM_7 [bp + 14]
%define STACK_IN_PARAM_8 [bp + 16]
%define STACK_IN_PARAM_9 [bp + 18]

; 栈出参 - 以函数入口处的sp为基准, 函数出口处的sp必须和入口处相同
; 必须先执行 mov si, sp 因为没有 mov ax, [sp + 4] 这样的指令
; 用完 STACK_OUT_PARAM_X 之后, 执行 pop bp
%define STACK_OUT_PARAM_1 [si + 0]
%define STACK_OUT_PARAM_2 [si + 2]
%define STACK_OUT_PARAM_3 [si + 4]
%define STACK_OUT_PARAM_4 [si + 6]
%define STACK_OUT_PARAM_5 [si + 8]
%define STACK_OUT_PARAM_6 [si + 10]
%define STACK_OUT_PARAM_7 [si + 12]
%define STACK_OUT_PARAM_8 [si + 14]
%define STACK_OUT_PARAM_9 [si + 16]

bits 16 ; ///< 16位汇编

;--------------------------------------------------------------------------------
; /// MBR程序入口
;--------------------------------------------------------------------------------
org MEMORY_ADDR_BOOT_CODE_ORG_ENTRY
	cli ; ///< 屏蔽中断
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, MEMORY_ADDR_STACK_TOP
	
	; /// 全局变量初始化
	mov byte[byte_status], al ; ///< 状态字节，初始化为FALSE
	mov byte[byte_udisk_sn], al; 
	
	mov word[word_disk_maximum_cylinder_number], ax
	mov word[word_disk_maximum_head_number], ax
	mov word[word_disk_maximum_sector_number], ax
	
	sti ; ///< 响应中断
	cld ; ///< 清方向标志位, 使设计到si,di的操作后, si++, di++
	
	; /// 直接在0x7c00操作, 不拷贝到其他扇区再操作, 我们拷贝U盘1#扇区到MEMORY_ADDDR_LOADER_MODULE
	mov [byte_udisk_sn], dl ; ///< 保存U盘号码0x80
	
	; /// 显示信息 - 从U盘启动
	mov si, str_start_boot_from_usb_device
	call fn_disp_str

	; /// 校验分区表-查找有效的分区表入口
	mov si, addr_partition_table
	xor ax, ax
	mov cx, CNT_PARTITION_ENTRY ; 分区入口(partition entry)共4条

label_verify_partition_entry_do_once:
	test byte [si], BYTE_FLAG_PARTITION_ACTIVE ; 判断该分区入口是否为激活
	jz label_verify_partition_entry_next ; ///< 如果分区表入口无效, 找下一个分区表入口
	inc ax ; ///< 保存-有效分区入口数量
	
	; /// bp为最后一个有效分区入口, 因为4个分区入口只有一个是激活的
	; /// 所以 bp 中保存的是唯一个被激活的分区入口
	mov bp, si

label_verify_partition_entry_next:
	add si, LEN_PARTITION_ENTRY ; ///< 切到下一个分区表入口
	loop label_verify_partition_entry_do_once ; ///< 判断该分区入口是否为激活
	
	dec ax
	jz label_proc_valid_partition_table ; ///< 如果激活的分区表入口数量为1, 转有效处理
	
	; /// 如果分区表入口校验无效(没有唯一激活的分区表入口), 就不搞了, 报错(无效分区表)后，死循环
	mov si, str_invalid_partition_table
	jmp label_show_msg_and_loop_dead

;--------------------------------------------------------------------------------
; /// 校验分区表
;--------------------------------------------------------------------------------
label_proc_valid_partition_table:
	; IBM/MS INT 13 Extensions - INSTALLATION CHECK
	; 
	; Parameter input
	; AH = 41h
	; BX = 55AAh
	; DL = drive (80h-FFh)
	;
	; Parameter output
	;
	; CF set on error (extensions not supported)
	; AH = 01h (invalid function)
	;
	; CF clear if successful
	; BX = AA55h if installed
	; AH = major version of extensions
	; 01h = 1.x
	; 20h = 2.0 / EDD-1.0
	; 21h = 2.1 / EDD-1.1
	; 30h = EDD-3.0
	; AL = internal use
	; CX = API subset support bitmap (see #00271)
	; DH = extension version (v2.0+ ??? -- not present in 1.x)
	;
	; Bitfields for IBM/MS INT 13 Extensions API support bitmap:
	;
	; Bit(s)  Description     (Table 00271)
	; 0      extended disk access functions (AH=42h-44h,47h,48h) supported
	; 1      removable drive controller functions (AH=45h,46h,48h,49h,INT 15/AH=52h)
	; supported
	; 2      enhanced disk drive (EDD) functions (AH=48h,AH=4Eh) supported.
	; Extended drive parameter table is valid (see #00273,#00278)
	; 3-15   reserved (0)

	mov dl, [byte_udisk_sn]     ; restore dl from bk_byte_dl
	mov ah, 41h
	mov bx, 55AAh
	int 13h
	
	jb short not_support_int_13h_extensions ; CF clear if successful
	cmp bx, 0AA55h      ; BX = AA55h if installed
	jnz not_support_int_13h_extensions
	; /// CX = API subset support bitmap (see #00271)
	test cl, 1 ; 0      extended disk access functions (AH=42h-44h,47h,48h) supported
	jz not_support_int_13h_extensions
							
	; /// 如果支持 int13h 磁盘扩展, 做标志, 跳到 用磁盘扩展方法去读扇区到内存
	; /// 不用动态修改代码的方式，太不正规了. 如果做补丁，可以这样动态修改代码.
	
	%ifdef SWITCH_USE_CHS_READ_SECTOR_TO_MEMORY
		jmp not_support_int_13h_extensions
	%else
		; /// 设置有效位标志-DISK_INSTALLATION_CHECK
		mov al, [byte_status];
		or al , BIT_VALID_DISK_INSTALLATION_CHECK_SET
		mov byte[byte_status], al
		jmp label_read_sectors_into_memory
	%endif
	
;--------------------------------------------------------------------------------

not_support_int_13h_extensions:
	; int 13h, ah = 08h
	;
	; parameter IN
	;
	; AH = 08h
	; DL = drive (bit 7 set for hard disk)
	; ES:DI = 0000h:0000h to guard against BIOS bugs
	;
	; parameter OUT
	;
	; CF set on error
	; AH = status (07h) (see #00234)
	; 
	; CF clear if successful
	; AH = 00h
	; AL = 00h on at least some BIOSes
	; BL = drive type (AT/PS2 floppies only) (see #00242)
	; CH = low eight bits of maximum cylinder number
	; CL = maximum sector number (bits 5-0)
	; high two bits of maximum cylinder number (bits 7-6)
	; DH = maximum head number
	; DL = number of drives
	; ES:DI -> drive parameter table (floppies only)
	mov dl, [byte_udisk_sn]
	mov di, 0 ; ///< ES:DI = 0000h:0000h to guard against BIOS bugs
	mov ah, 8
	stc
	int 13h

	; 先保存得到的MaxCHS, 不管对错, 后面判断完后，会设置有效位标志-已经得到磁盘的最大CHS
	
	; 已经得到了CHS的最大值, 保存
	pushf
	pusha
	
	; CH = low eight bits of maximum cylinder number
	; CL = maximum sector number (bits 5-0)
	; high two bits of maximum cylinder number (bits 7-6)
	mov ax, cx
	shr al, 6
	xchg ah, al
	mov [word_disk_maximum_cylinder_number], ax
	
	; DH = maximum head number
	xor ax, ax
	mov al, dh
	mov word[word_disk_maximum_head_number], ax
	
	; CL = maximum sector number (bits 5-0)
	mov ax, cx
	and ax, 0x3f
	mov word[word_disk_maximum_sector_number], ax
	
	; /// 清除有效位标志-已经得到磁盘的最大CHS
	; /// 因为现在还不知道得到的值正确与否
	; /// 现在保存，是为了在第一现场保存, 实现起来简单可靠
	; /// 后面判断时, 将寄存器的值都改变了
	mov al, [byte_status];
	and al , BIT_VALID_MAX_CHS_CLR
	mov byte[byte_status], al

	popa
	popf
	
;	<bochs:74> r
;	rax: 00000000_00000000 rcx: 00000000_0009aeff
;	rdx: 00000000_0000fe01 rbx: 00000000_0000aa55
;	rsp: 00000000_00007bf0 rbp: 00000000_00007dbe
;	rsi: 00000000_000e7dfe rdi: 00000000_00000000
;	r8 : 00000000_00000000 r9 : 00000000_00000000
;	r10: 00000000_00000000 r11: 00000000_00000000
;	r12: 00000000_00000000 r13: 00000000_00000000
;	r14: 00000000_00000000 r15: 00000000_00000000
;	rip: 00000000_00007c73
;	eflags 0x00000202: id vip vif ac vm rf nt IOPL=0 of df IF tf sf zf af pf cf
	
	jb label_cant_get_chs ; ///< CF clear if successful
	and ah, ah ; ///< AH = 00h is ok
	jnz label_cant_get_chs ; ///< ah must be 0x00
	mov al, dh ; ///< maximum head number, now dh = 0xfe = 254
	inc al
	jz label_cant_get_chs ; ///< maximum head number is 255, head number range(1 ~ 255)
	; /// now ax = 0ff
	and cx, 3Fh ; /// < now cx = 0xaeff
	jz label_cant_get_chs ; ///< sector number must > 0, now sector number = 0x3f = 63

	jmp label_save_chs
	
	; /// 原版在执行完(int 13h, ah = 8)后，有逻辑错误
	; /// 如果查询CHS失败, 就无法继续强制执行了
	; /// 因为得不到CHS, 按照CHS读取磁盘扇区到内存，一定会失败的...
label_cant_get_chs:
	mov si, str_error_cant_get_chs
	jmp label_show_msg_and_loop_dead
	
label_save_chs:	
	; /// 设置有效位标志-已经得到磁盘的最大CHS
	mov al, [byte_status];
	or al , BIT_VALID_MAX_CHS_SET
	mov byte[byte_status], al

label_read_sectors_into_memory:
	push SECTOR_BLOCK_SIZE_BOOT_CODE_SEG_LIMIT
	push DISK_SECTOR_INDEX_BOOT_CODE
	push MEMORY_ADDR_SECTOR_NEED_COPY_TO_DEST
	; /// @fn fn_read_sectors_into_memory(WORD wDstAddrCopyTo, WORD wSrcSectorIndex, WORD wSrcSectorBlockCnt)
	call fn_read_sectors_into_memory
	add sp, (3 * 2) ; ///< 堆栈平衡
	jnb ok_proc_read_sectors_into_memory ; addr_word_boot_signature

err_loading_operating_system:
	mov si, str_error_loading_operating_system ; show str_error_loading_operating_system
	jmp label_show_msg_and_loop_dead
;--------------------------------------------------------------------------------

ok_proc_read_sectors_into_memory:
	mov ax, [ds:7DFEh]    ; addr_word_boot_signature
	cmp ax, 0AA55h
	jz ok_boot_signature
	jmp err_loading_operating_system ; str_error_loading_operating_system
;--------------------------------------------------------------------------------

ok_boot_signature:
	cli
	
	; /// 显示信息, MBR程序已经运行ok
	mov si, str_mbr_code_execute_over
	call fn_disp_str

	; /// only for debug, addr bgin and addr end
	; mov ax, MEMORY_ADDR_SECTOR_NEED_COPY_TO_DEST
	; mov bx, MEMORY_ADDR_SECTOR_NEED_COPY_TO_DEST_LAST
	
	; mov cx, DISK_ADDR_SECTOR_NEED_COPY_TO_DEST
	; mov dx, DISK_ADDR_SECTOR_NEED_COPY_TO_DEST_LAST
	
	%ifdef SWITCH_WHEN_MBR_END_LOOP_DEAD
		jmp $
	%else
		; /// 准备跳进已经载入的第一个新扇区, 这些新扇区在U盘上和内存中都是连续的
		jmp MEMORY_ADDR_SECTOR_NEED_COPY_TO_DEST
	%endif

label_show_msg_and_loop_dead:
	call fn_disp_str
	jmp $

; =============== S U B R O U T I N E =======================================
fn_disp_str:
	lodsb
	and al, al
	jz fn_disp_str_end
	mov ah, 0Eh
	mov bx, 7
	int 10h             ; - VIDEO - WRITE CHARACTER AND ADVANCE CURSOR (TTY WRITE)
							; AL = character, BH = display page (alpha modes)
							; BL = foreground color (graphics modes)
	jmp fn_disp_str
fn_disp_str_end:
	ret

; =============== S U B R O U T I N E =======================================

; /// @fn fn_read_sectors_into_memory(WORD wDstAddrCopyTo, WORD wSrcSectorIndex, WORD wSrcSectorBlockCnt)
; /// @brief 读扇区到内存
; /// @param WORD wDstAddrCopyTo (读磁盘扇区到内存时的)目标内存地址
; /// @param WORD wSrcSectorIndex (读磁盘扇区到内存时的)源扇区起始索引
; /// @param WORD wSrcSectorBlockCnt (读磁盘扇区到内存时的)源扇区块数

; /// 函数要ret, 必须保持堆栈平衡! 否则返回时，不是调用此函数汇编命令的下一个字节地址
fn_read_sectors_into_memory:
; /// 保护现场 bp和sp
 	push bp
 	push sp

	; /// 使bp回到函数入口处的值
	push ax
 	mov ax, sp
 	add ax, 6
 	mov bp, ax
	pop ax
	
	pusha ; ///< => 函数入口保护所有普通寄存器
	
	; /// 读扇区之前, 将磁盘重置 
	;	DISK - RESET DISK SYSTEM
	; Note: Forces controller to recalibrate drive heads (seek to track 0)

	;AH = 00h
	;DL = drive (if bit 7 is set both hard disks and floppy disks reset)

	;Return:
	;AH = status (see #00234)
	;CF clear if successful (returned AH=00h)
	;CF set on error
	
	xor ah, ah
	mov dl, [byte_udisk_sn]
	int 13h
	jb fn_read_sectors_into_memory_end ; CF clear if successful ; ///< pb 0x7cfc

	; /// 根据磁盘安装检查的结果
	; /// 选择使用int 13h ah = 42h 扩展读扇区
	; /// 还是使用int 13h ah = 2h 根据CHS来读扇区
	test byte[byte_status], BIT_VALID_DISK_INSTALLATION_CHECK_SET
	jz label_read_disk_to_memory_by_chs ; ///< 不是TRUE(磁盘安装检查无效), 转 int13h, ah = 2 读扇区
	
	; /// 磁盘安装检查有效时, 使用磁盘扩展读功能, 读扇区到内存
	; /// 使用 int13h, ah = 0x42 读扇区

	;	Format of disk address packet:

	;Offset  Size    Description     (Table 00272)
	;10h    QWORD   (EDD-3.0, optional) 64-bit flat address of transfer buffer;
	;				used if DWORD at 04h is FFFFh:FFFFh
	;08h    QWORD   starting absolute block number
	;				(for non-LBA devices, compute as
	;				(Cylinder*NumHeads + SelectedHead) * SectorPerTrack +
	;				SelectedSector - 1
	;04h    DWORD   -> transfer buffer
	;02h    WORD    number of blocks to transfer (max 007Fh for Phoenix EDD)
	;01h    BYTE    reserved (0);
	;00h    BYTE    size of packet (10h or 18h)

	; /// 压入 disk address packet, 并将栈顶给si，供 int 13h, ah = 0x42 使用
	; /// 这么搞确实省空间，不过很容易填错参数, 分析者也容易看错参数
	
	; fn_read_sectors_into_memory(WORD wDstAddrCopyTo, WORD wSrcSectorIndex, WORD wSrcSectorBlockCnt)
	;08h    QWORD   starting absolute block number
	xor ax, ax
	push ax
	push ax
	push ax
	mov ax, STACK_IN_PARAM_2
	push ax

	;04h    DWORD   -> transfer buffer
	xor ax, ax
	push ax
	mov ax, STACK_IN_PARAM_1
	push ax
	
	;02h    WORD    number of blocks to transfer (max 007Fh for Phoenix EDD)
	mov ax, STACK_IN_PARAM_3
	push ax
	
	push 0010h ;00h    BYTE    size of packet (10h or 18h)
			   ;01h    BYTE    reserved (0);
			 
	; /// DS:SI -> disk address packet
	mov si, sp
	mov ah, 0x42
	mov dl, [byte_udisk_sn]     ; DL = drive
	int 13h             ; DISK - READ SECTORS INTO MEMORY
	
	; /// 这里add ap, 不会引起 CF位变化, 因为高位是栈顶, 恢复的栈指针偏移不到(0x7c00 - 0x6fff)
	; /// 所以不用考虑保存CF的事情
	add sp, (8 * 2) ; ///< 堆栈平衡
	jmp fn_read_sectors_into_memory_after

	; /// 磁盘安装检查无效时，根据MaxCHS读磁盘到内存
label_read_disk_to_memory_by_chs:
	xor ax, ax
	push ax ; ///< STACK_OUT_PARAM_4, sector
	push ax ; ///< STACK_OUT_PARAM_3, head
	push ax ; ///< STACK_OUT_PARAM_2, track
	mov ax, STACK_IN_PARAM_2 ; ///< (WORD wDstAddrCopyTo, WORD wSrcSectorIndex, WORD wSrcSectorBlockCnt)
	push ax
	call fn_LBA_2_CHS ; ///< fn_LBA_2_CHS(wSrcSectorIndex, track, head, sector)

	; AH = 02h
	; AL = number of sectors to read (must be nonzero)
	; CH = low eight bits of cylinder number
	; CL = sector number 1-63 (bits 0-5)
	; high two bits of cylinder (bits 6-7, hard disk only)
	; DH = head number
	; DL = drive number (bit 7 set for hard disk)
	; ES:BX -> data buffer
	; 
	; Return:
	; 
	; CF set on error
	; if AH = 11h (corrected ECC error), AL = burst length
	; 
	; CF clear if successful
	; AH = status (see #00234)
	; AL = number of sectors transferred (only valid if CF set for some
	; 	BIOSes)

	; /// fn_read_sectors_into_memory(WORD wDstAddrCopyTo, WORD wSrcSectorIndex, WORD wSrcSectorBlockCnt)
	; /// fn_LBA_2_CHS(wSrcSectorIndex, track, head, sector)
	mov si, sp ; ///< !
	mov ax, STACK_OUT_PARAM_2
	mov ch, al          ; CH = track
	
	mov ax, STACK_OUT_PARAM_4
	mov cl, al          ; CL = sector
	
	mov ax, STACK_OUT_PARAM_3
	mov dh, al          ; DH = head
	
	mov bx, STACK_IN_PARAM_1
	
	mov dl, [byte_udisk_sn] ; DL = drive number (bit 7 set for hard disk)
	
	mov ax , STACK_IN_PARAM_3 ; AL = number of sectors to read (must be nonzero)
	mov ah, 2h ; AH = 02h

	; /// 因为要用到出参(call fn_LBA_2_CHS), 所以在这里堆栈平衡(call fn_LBA_2_CHS)
	add sp, (4 * 2) ; ///< 必须要堆栈平衡(call fn_LBA_2_CHS), 否则函数返回时, 地址不对了

	int 13h             ; DISK - READ SECTORS INTO MEMORY
	
fn_read_sectors_into_memory_after:
	jb fn_read_sectors_into_memory_end ; ///< pb 0x7d51
	cmp ah, 0x00 ; ///< AH = status (see #00234), 00h = successful completion
	jnz fn_read_sectors_into_memory_end
	
	clc ; ///< 清除进位标记，代表成功

fn_read_sectors_into_memory_end:
	
	popa ; ///< <= 函数入口保护所有普通寄存器

	; /// 恢复现场 bp和sp
 	pop sp
 	pop bp

	ret

; /// fn_LBA_2_CHS(WORD IN wSrcSectorIndex, WORD OUT track, WORD OUT head, WORD OUT sector)
fn_LBA_2_CHS:
	; /// 保护现场 bp和sp
 	push bp
 	push sp

	; /// 使bp回到函数入口处的值
	push ax
 	mov ax, sp
 	add ax, 6
 	mov bp, ax
	pop ax
	
	; /// LBA to CHS or CHS to LBA 的算法资料
	; /// 参照 http://blog.csdn.net/lostspeed/article/details/48895975
	
	; /// C, H and S are the cylinder number, the head number, and the sector number
	; /// LBA is the logical block address
	; /// HPC is the maximum number of heads per cylinder (reported by disk drive, typically 16 for 28-bit LBA)
	; /// SPT is the maximum number of sectors per track (reported by disk drive, typically 63 for 28-bit LBA)
	; /// C = LBA ÷ (HPC × SPT)
	; /// H = (LBA ÷ SPT) mod HPC
	; /// S = (LBA mod SPT) + 1
	
	; /// 已经保存好的MaxCHS
	; /// word_disk_maximum_cylinder_number 磁盘最大柱面数
	; /// word_disk_maximum_head_number 磁盘最大头数
	; /// word_disk_maximum_sector_number 磁盘最大扇区数
	
	; /// STACK_IN_PARAM_1 是 wSrcSectorIndex
	; /// STACK_IN_PARAM_2 是 track
	; /// STACK_IN_PARAM_3 是 head
	; /// STACK_IN_PARAM_4 是 sector
	
	; /// DIV r/m8, AL ← Quotient, AH ← Remainde
	
	; /// 根据上述参考资料, 整理计算出参CHS的公式
	; /// STACK_IN_PARAM_2 = STACK_IN_PARAM_1 ÷ word_disk_maximum_sector_number ÷ word_disk_maximum_head_number
	; /// STACK_IN_PARAM_4 = (STACK_IN_PARAM_1 mod word_disk_maximum_sector_number) + 1
	; /// STACK_IN_PARAM_3 = (STACK_IN_PARAM_1 ÷ word_disk_maximum_sector_number) mod word_disk_maximum_head_number

	mov ax, STACK_IN_PARAM_1
	mov cl, [word_disk_maximum_sector_number]
	div cl ; al = STACK_IN_PARAM_1 ÷ word_disk_maximum_sector_number, ah = STACK_IN_PARAM_1 mod word_disk_maximum_sector_number
	
	inc ah
	mov STACK_IN_PARAM_4, ah
	
	xor ah, ah
	mov cl, [word_disk_maximum_head_number]
	div cl
	
	mov STACK_IN_PARAM_2, al
	mov STACK_IN_PARAM_3, ah
	
	; /// 恢复现场 bp和sp
 	pop sp
 	pop bp
	ret
	
;------------------------------------------------
; 宏: LBA_TO_CHS
; 描述:
;       参数 1: 物理 sector 号
;-----------------------------------------------
;%macro LBA_TO_CHS 1
;        mov ax, %1                      ; paramter
;        mov cl, SPT
;        div cl                          ; al = LBA / SPT, ah = LBA % SPT        
		; cylinder = LBA / SPT / HPC
;        mov ch, al
;        shr ch, (HPC / 2)               ; ch = cylinder                
		; head = (LBA / SPT ) % HPC
;        mov dh, al
;        and dh, 1                       ; dh = head
		; sector = LBA % SPT + 1
;        mov cl, ah
;        inc cl                          ; cl = sector
;%endmacro

;--------------------------------------------------------------------------------
; /// 字符串定义
;--------------------------------------------------------------------------------
str_start_boot_from_usb_device:
	; db 0x0d, 0x0a, "start boot from usb device", 0x0d, 0x0a, 0
	db 0x0d, 0x0a, 'mb ', 0
	
str_mbr_code_execute_over:
	; db "mbr code execute over", 0x0d, 0x0a, 0
	db 'me ', 0
	
str_invalid_partition_table:
	; db 'error : Invalid partition table', 0x0d, 0x0a, 0
	db 'e1 ', 0

str_error_loading_operating_system:
	; db 'error loading operating system', 0x0d, 0x0a, 0
	db 'e2 ', 0
	
str_error_cant_get_chs:
	; db 'error cant get CHS', 0x0d, 0x0a, 0
	db 'e3 ', 0

;--------------------------------------------------------------------------------
; /// 临时变量
;--------------------------------------------------------------------------------
; /// 状态字节, 每一位代表一个状态
; /// bit 0 分区是否有效, 1 = 分区有效, 0 = 分区无效
byte_status:
	db 0xcd
	
byte_udisk_sn: ; ///< 进入MBR代码时, DL中存放的是硬盘号码, 0x80代表第一块硬盘(即U盘)
	db 0xcd

	; /// int 13h, ah = 8h 时，取到的磁盘最大柱面数
word_disk_maximum_cylinder_number:
	dw 0xcdcd
	
	; /// int 13h, ah = 8h 时，取到的磁盘最大头数
	; /// HPC is the maximum number of heads per cylinder (reported by disk drive, typically 16 for 28-bit LBA)
word_disk_maximum_head_number:
	dw 0xcdcd

	; /// int 13h, ah = 8h 时，取到的磁盘最大扇区数
	; /// SPT is the maximum number of sectors per track (reported by disk drive, typically 63 for 28-bit LBA)
word_disk_maximum_sector_number:
	dw 0xcdcd

;--------------------------------------------------------------------------------
; 填充区
;--------------------------------------------------------------------------------
times 512 - ($ - $$) - 2 - (16 * 4) db 0
	
	; /// 对于不同的U盘分区size, 这里的值是不同的, partition_entry = 16, 共4个
	; /// 所以，使用不同的U盘做实验时, 格式化U盘后, 需要将U盘主分区的分区表入口抄下来，设置成下面的4个分区表入口
	; /// 这样才能将这512字节写入U盘0#扇区, 作为可用的MBR代码
	; /// 逆向UltraIos格式化U盘，写入的MBR代码, 可以看到代码中对此主分区分区表入口表, 做了校验.
	; /// 如果通不过校验, 不会加载后续的扇区到内存, 会跳到出错处理, 或走硬盘上的引导代码
	; /// 做实验时, 不能动格式化程序作出的扇区内容. 否则, 在Windows中插入U盘时, 会弹出提示"是否格式化此U盘"
	; /// 我们需要找出可以做实验用的连续扇区, 参照 http://blog.csdn.net/lostspeed/article/details/48804455
	; /// 在我们自己实现的MBR中, 要载入找到的连续可用扇区，载入内存, 用来做 boot loader 实验
	
	;	Offset       0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F
	;	0000001B0                                              80 00
	;	0000001C0   02 00 0C FE FF AF 01 00  00 00 FF 3F E7 00
	
;--------------------------------------------------------------------------------
; /// Partition Table
;--------------------------------------------------------------------------------
addr_partition_table:
	db 0x80, 0x00, 0x02, 0x00, 0x0c, 0xfe, 0xff, 0xaf, 0x01, 0x00, 0x00, 0x00, 0xff, 0x3f, 0xe7, 0x00
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	
;--------------------------------------------------------------------------------
; /// Boot signature
;--------------------------------------------------------------------------------
addr_word_boot_signature:
	db 0x55, 0xaa