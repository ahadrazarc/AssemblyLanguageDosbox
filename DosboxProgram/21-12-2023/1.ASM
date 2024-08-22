.model small
.stack 100h
.data
.code
main proc
; input the character
mov ah,1
int 21h
; output the character (display it)
mov dl,al
mov ah,2
int 21h
;exit from the main procedure
mov ah,4ch
int 21h

main endp
end main
