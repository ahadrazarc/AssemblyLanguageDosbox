.model small
.stack 100h
.386
.data
    str1 db 'Enter first number: $'
    str2 db 'Enter second number: $'
    str3 db 'Result: $'
    menu db 13,10,'Menu:',13,10,'1. Addition',13,10,'2. Subtraction',13,10,'3. Multiplication',13,10,'4. Division',13,10,'5. Exit',13,10,'$'
    choice db ?
    choose db 'You want another calculation (y/n)$'
    num1 db ?
    num2 db ?
    result db ?
.code
main proc
    mov ax, @data
    mov ds, ax

menu_loop:
    lea dx, menu
    mov ah, 9
    int 21h

    ; Get user choice
    mov ah, 1
    int 21h
    mov choice, al

    ; Perform operation based on user choice
    cmp choice, '1'
    je addition
    cmp choice, '2'
    je subtraction
    cmp choice, '3'
    je multiplication
    cmp choice, '4'
    je division
    cmp choice, '5'
    je exit_program
addition:
lea dx,str1
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    mov bl,al

mov ah,2
mov dx,10
int 21h

    lea dx,str2
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    mov bh,al
   sub bh,48
   sub bl,48

mov ah,2
mov dx,10
int 21h

    lea dx,str3
    mov ah,9
    int 21h

    add bh,bl
     add bh,48
    mov dl,bh
    mov ah,2
    int 21h

jmp condition
subtraction:
lea dx, str1
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48
mov bl, al

lea dx, str2
mov ah, 9
int 21h

mov ah, 1
int 21h

    sub al, 48
mov cl, al

mov ah, 0  ; Clear AH to avoid operand type mismatch
mov al, bl  ; Move the first operand to AL

sub al, cl
mov result, al  ; Store the result

lea dx, str3
mov ah, 9
int 21h

mov dl, result
add dl, 48
mov ah, 2
int 21h

jmp condition

multiplication:
    lea dx, str1
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov num1, al
    mov ah,2
mov dx,10
int 21h
    lea dx, str2
  mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov num2, al


      mul num1
    mov result, al

   mov ah,2
mov dx,10
int 21h
    lea dx, str3
    mov ah, 9
    int 21h

 
    mov dl, result
    add dl, 48
    mov ah, 2
    int 21h

jmp condition

division:
 
lea dx, str1
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48
mov num1, al
mov ah, 0  ; Clear AH to avoid operand type mismatch

lea dx, str2
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48
mov num2, al


xor dx, dx  ; Clear DX before division
mov ax, 0   ; Clear AX before division
mov al, num1  ; Move num1 to AL before division
div num2
mov result, al

lea dx, str3
mov ah, 9
int 21h

mov dl, result
add dl, 48
mov ah, 2
int 21h
jmp condition

condition:
lea dx,choose
mov ah,9
int 21h
mov ah,1
int 21h
cmp al,'y'
je menu_loop
cmp al,'n'
je exit_program

exit_program:
    mov ah, 4ch
    int 21h

main endp
end main
