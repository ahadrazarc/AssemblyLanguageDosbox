dosseg
.model small
.stack 100h
.data
string db 3 dup(?)
.code
main proc
mov ax,@data
mov ds,ax
mov si,offset string
l1:
mov ah,1
int 21h
cmp al,13
je PrintS
mov [si],al
inc si
jmp l1
PrintS:
mov cx,3
mov si,offset string
l2:
mov dl,[si]
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h
inc si
loop l2
mov ah, 4ch
int 21h
main endp
end main