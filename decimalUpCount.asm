.model small
.code
mov cl,00h
mov al,00h
mov ah,03h
int 10h

back: mov bh,00h
      mov ah,02h
      mov dl,00h
      mov dh,00h
      int 10h

      mov al,cl
      add al,00h
      aam
      add ax,3030h
      mov ch,al
      mov dl,ah

      mov ah,02h
      int 21h

      mov dl,ch

      mov ah,02h
      int 21h

      call delay
      inc cl
      mov ax,00h
      cmp cl,100d
      jne back
      je last

 delay proc near
 push ax
 push bx
 push cx
 mov cx,0ffh

 ag: mov bx,0ffh

 ag1: nop
      dec bx
      jnz ag1
      dec cx
      jnz ag
      pop cx
      pop bx
      pop ax
  ret
delay endp
last: mov ah,4ch
      int 21h

end
