.model small
.stack 100h
.data
array db '2,4,6,8,10,12,14,16,18,20$'
.code
main proc
mov ax,@data
mov ds,ax
int 21h

mov cx,10
inc cx
mov dx, offset array
mov ah,9
int 21h

mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
