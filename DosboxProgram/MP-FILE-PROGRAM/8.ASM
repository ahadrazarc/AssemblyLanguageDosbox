\.model small
.stack 100h
.data
.code
main proc
;initialization
mov cx,62
mov dx,48
l1:
mov ah,2
int 21h

inc dx
loop l1
mov ah,4ch
int 21h

main endp
end main
