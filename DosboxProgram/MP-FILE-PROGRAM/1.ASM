.model small
.stack 100h
.386

.data
    str1 db 'Enter First Number: $'
    str2 db 'Enter Second Number: $'
    str3 db 'Enter Operator (+, -, *, /): $'
    result_msg db 'Result is: $'
    choice_msg db 'Do you want to perform another operation? Enter Y or N: $'
    
    num1 db ?
    num2 db ?
    result db ?
    choice db ?
    
.code
main proc
    mov ax, @data
    mov ds, ax

menu_loop:
    lea dx, str1
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov num1, al

    mov dx,10
    mov ah,2
    int 21h

    lea dx, str2
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov num2, al

    mov dx,10
    mov ah,2
    int 21h

    lea dx, str3
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    mov choice, al

    ; Perform operation based on user choice
    cmp choice, '+'
    je addition
    cmp choice, '-'
    je subtraction
    cmp choice, '*'
    je multiplication
    cmp choice, '/'
    je division

addition:
    mov al, num1
    add al, num2
    mov result, al
    jmp display_result

subtraction:
    mov al, num1
    sub al, num2
    mov result, al
    jmp display_result

multiplication:
    mov al, num1
    imul al, num2
    mov result, al
    jmp display_result

division:
    mov al, num1
    xor ah, ah
    idiv num2
    mov result, al

display_result:
    lea dx, result_msg
    mov ah, 9
    int 21h

    mov dl, result
    add dl, 48
    mov ah, 2
    int 21h

    lea dx, choice_msg
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h

    cmp al, 'Y'
    je menu_loop
    cmp al, 'N'
    je exit_program

exit_program:
    mov ah, 4ch
    int 21h

main endp         
end main
