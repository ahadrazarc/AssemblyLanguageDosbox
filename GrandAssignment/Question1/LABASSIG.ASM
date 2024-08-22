.model small
.stack 100h
.data
; two variables
var1 db 'Capital Alphabets are:$'
var2 db 'Small Alphabets are:$'
.code
main proc
mov ax,@data
mov ds,ax

lea dx,var1
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov cx,26
mov dx,65

l1:
mov ah,2
int 21h

inc dx
loop l1

mov dl,10
mov ah,2
int 21h

lea dx,var2
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h

mov cx,26
mov dx,97

l2:
mov ah,2
int 21h

inc dx
loop l2

mov ah,4ch
int 21h

main endp
end main
