.model small
.stack 100h
.386

.data
    newline db 13, 10, '$'
    str1 db 'Enter First Number: $'
    str2 db 'Enter Second Number: $'
    str3 db 'Enter Operator (+, -, *, /): $'
    result_msg db 'Result is: $'
    choice_msg db 'Do you want to perform another operation:(Y/N) $'
    
    num1 db ?
    num2 db ?
    result dw ?
    choice db ?
    
.code
main proc
    mov ax, @data
    mov ds, ax

menu_loop:
    ; Prompt for the next line
    mov dx,10
    mov ah,2
    int 21h

    ; Prompt for the first number
    lea dx, str1
    mov ah, 9
    int 21h

    ; Input the first number
    mov ah, 1
    int 21h
    sub al, 48
    mov num1, al

    ; Display newline
    mov dx, 10
    mov ah, 2
    int 21h

    ; Prompt for the second number
    lea dx, str2
    mov ah, 9
    int 21h

    ; Input the second number
    mov ah, 1
    int 21h
    sub al, 48
    mov num2, al

    ; Display newline
    mov dx, 10
    mov ah, 2
    int 21h

    ; Prompt for the operator
    lea dx, str3
    mov ah, 9
    int 21h

    ; Input the operator
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
    cmp choice, 'N'
    je exit_program

addition:
    ; Add the numbers
    mov al, num1
    add al, num2
    mov result, ax
    jmp display_result

subtraction:
    ; Subtract the numbers
    mov al, num1
    sub al, num2
    mov result, ax
    jmp display_result

multiplication:
    ; Multiply the numbers
    mov al, num1
    imul num2
    mov result, ax
    jmp display_result

division:
    ; Divide the numbers
    mov al, num1
    xor ah, ah
    idiv num2
    mov result, ax
    jmp display_result

display_result:
    ; Display newline
    mov dx, 10
    mov ah, 2
    int 21h

    ; Display result message
    lea dx, result_msg
    mov ah, 9
    int 21h

    ; Display the result
    mov dx, result
    add dx, 48
    mov ah, 2
    int 21h

    ; Display newline
    lea dx, newline
    mov ah, 9
    int 21h

    ; Prompt for another operation
    lea dx, choice_msg
    mov ah, 9
    int 21h

    ; Input choice (Y or N)
    mov ah, 1
    int 21h

    ; Check user's choice
    cmp al, 'Y'
    je menu_loop
    cmp al, 'N'
    je exit_program

exit_program:
    ; Exit the program
    mov ah, 4ch
    int 21h

main endp
end main
