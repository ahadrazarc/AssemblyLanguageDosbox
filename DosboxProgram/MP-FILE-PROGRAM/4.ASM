.model small
.stack 100h
.data
.code
main proc

;enter your first number
mov ah,1
int 21h

;storing your first number in bl
mov bl,al

;enter your second number
mov ah,1
int 21h

;formula
sub bl,al

;num1-num2=ans+48
add bl,48

mov dl,bl
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
