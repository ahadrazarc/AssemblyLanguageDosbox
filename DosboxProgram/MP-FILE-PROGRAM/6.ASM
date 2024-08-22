.model small
.stack 100h
.data
.code
main proc
mov ah,1
int 21h

mov bl,al
mov dl,bl
add dl,32
MOV AH,2
INT 21H

SUB DL,32
MOV AH,2
INT 21H

mov ah,4ch
int 21h

 main endp
 end main

