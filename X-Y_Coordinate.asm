.model small

disp macro msg
lea dx,msg
mov ax,09h
int 21h
endm

.data
row  db 02 dup(0)
column  db 02 dup(0)
msg1 db 0dh,0ah,"enter x-coordinate ::$"
msg2 db 0dh,0ah,"enter y-coordinate ::$"

.code
mov ax,@data
mov ds,ax
disp msg1
lea si,row
call read
disp msg2
lea si,column
call read
lea si,row
mov ah,[si]
inc si
mov al,[si]
sub ax,3030h
aad
mov dh,al
lea si,column
mov ah,[si]
inc si
mov al,[si]
sub ax,3030h
aad
mov dl,al

mov ah,00h
mov al,03h
int 10h

mov ah,02h
int 10h
jmp final

read proc near
 mov cx,02h

back: mov ah,01h
      int 21h
      mov [si],al
      inc si
      dec cx
      jnz back
  ret
read endp

final: mov ah,01h
       int 21h
       mov ah,4ch
       int 21h
end
