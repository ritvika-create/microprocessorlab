.model small

display macro msg
lea dx,msg
mov ax,09h
int 21h
endm
.data
msg1 db 0dh,0ah,"enter file name for creation $"
msg2 db 0dh,0ah,"file created successfully $"
msg3 db 0dh,0ah,"file creation failed$"
msg4 db 0dh,0ah,"enter file name to be deleted $"
msg5 db 0dh,0ah,"file deleted successfully $"
msg6 db 0dh,0ah,"file deletion failed $"
fname1 db 02 dup(0)
fname2 db 02 dup(0)

.code
mov ax,@data
mov ds,ax

display msg1

mov si,00h
back1: mov ah,01h
       int 21h
       cmp al,0dh
       je  next1
       mov fname1[si],al
       inc si
       jmp back1

next1: mov fname1[si],'$'
       lea si,fname1
       mov cx,00h

       mov ah,3h
       int 21h

       jc cfail
       display msg2
       jmp del

cfail: display msg3

del: display msg4

mov si,00h
back2: cmp al,0dh
       je next2
       mov fname2[si],al
       inc si
       jmp back2

next2: mov fname2[si],'$'
       lea dx,fname2

       mov ah,41h
       int 21h

       jc dfail
       display msg5
       jmp last

dfail: display msg6

last: mov ah,4ch
      int 21h
end

