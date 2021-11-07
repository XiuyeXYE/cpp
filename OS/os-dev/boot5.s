


bits 16

global start

start:


    cli 

    xor ax,ax
    mov ds,ax
    mov es,ax
    mov ss,ax

seta20.1:
    in al,0x64
    test al,0x2
    jnz seta20.1

    mov al,0xd1
    out 0x64,al

seta20.2:
    in al,064
    test al,0x2
    jnz seta20.2

    mov al,0xdf
    out 0x60,al

    ;lgdt gdtdesc


%define SEG_NULLASM    dw 0, 0 db 0, 0, 0, 0
%define SEG_ASM(type,base,lim) dw (((lim) >> 12) & 0xffff), ((base) & 0xffff) db (((base) >> 16) & 0xff), (0x90 | (type)), (0xC0 | (((lim) >> 28) & 0xf)), (((base) >> 24) & 0xff)
%define STA_X     0x8       ; Executable segment
%define STA_W     0x2       ; Writeable (non-executable segments)
%define STA_R     0x2       ; Readable (executable segments)

gdt:
  dw 0,0
  db 0,0,0,0 
  dw (((0xffffffff)>>12)&0xffff),((0x0)&0xffff) 
  db (((0x0)>>16)&0xff),(0x90|(STA_X|STA_R)),0xc0|(((0xffffffff)>>28)),(((0x0)>>24)&0xff)                            ; null seg

  ;SEG_ASM(STA_W, 0x0, 0xffffffff)         ; data seg




gdtdesc:
  dw   gdtdesc - gdt - 1             ; sizeof(gdt) - 1
  dd   gdt   

