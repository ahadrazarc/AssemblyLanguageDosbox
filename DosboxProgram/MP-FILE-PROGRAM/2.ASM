; adding two numbers
.model small
.stack 100h
.data
.code
main proc
mov bl,2
mov cl,3
add bl,cl
;USING ASCII CODE
add bl,48
mov dl,bl
mov ah,2
int 21h

;procedure ending
mov ah,4ch
int 21h
main endp
end main
