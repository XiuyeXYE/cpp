;$$ - start position
	bits 16
	
	org 07c00h






	mov ax,cs
	mov ds,ax
	mov es,ax

   
	
	;output bootMsg -- first msg
	mov ax,bootMsg  ;input parameter msg
	mov cx,bootMsgLen		;str length
	mov dh,00h ;第1行
	call ShowMsg	;output str
	
	;load second Second Sector Code data
	;Have to load it! Or errors will occur.
	call LoadSecondSectorRun
	
	;exec second sector code
	call SecondSectorRun
	
 
  ;-----------------  打开A20  ----------------
   in al,0x92
   or al,0000_0010B
   out 0x92,al

 

 
  mov eax, cr0
  or eax, 0x00000001
  mov cr0, eax

  mov ax,0x3f2
  in ax,0
  out 100,ax


	jmp $ ;loop at current postion
	
ShowMsg:
	mov bp,ax
	mov ax,01301h
	mov bx,000ch
	mov dl,0 ;列 dh 是行
	int 10h
	ret
	
	;载入第二个扇区数据,从磁盘到内存
LoadSecondSectorRun:
	mov ah,02h                            ;读磁盘扇区  
    mov al,01h                            ;读取1个扇区  
    mov ch,00h                            ;起始磁道  
    mov cl,02h                            ;起始扇区  
    mov dh,00h                            ;磁头号  
    mov dl,00h                            ;驱动器号  
    mov bx,SecondSectorRun                             ;存储缓冲区  
    int 13h
    ret 
	
bootMsg: 
	db "Hello,World!"
	bootMsgLen equ $-bootMsg
	;$ -current position 
times 510-($-$$) db 0
dw 0xaa55

SecondSectorRun:
	;output secondSectorRunMsg -- first msg
	mov ax,secondSectorRunMsg  ;input parameter msg
	mov cx,ssrmLen		;str length
	mov dh,01h ;第2行
	call ShowMsg	;output str
	


secondSectorRunMsg:
	db "Loaded Second Sector Data Successfully!"
	ssrmLen equ $-secondSectorRunMsg
times 512*2-($-$$) db 0
