.model small
.stack 100h

.data
    inputString db 'numl', 0     ; Input string terminated with null character
    outputString db 20 DUP(?)     ; Output string buffer

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, inputString     ; SI points to the input string
    lea di, outputString    ; DI points to the output string

convertLoop:
    mov al, [si]           ; Load the character from inputString into AL
    cmp al, 0              ; Check if it is the null terminator
    je  endConversion       ; If yes, jump to the end of the program

    cmp al, 'a'             ; Compare with lowercase 'a'
    jl  notLowerCase        ; If less, it is not a lowercase letter
    cmp al, 'z'             ; Compare with lowercase 'z'
    jg  notLowerCase        ; If greater, it is not a lowercase letter

    sub al, 32              ; Convert lowercase to uppercase by subtracting 32

notLowerCase:
    mov [di], al            ; Store the character in the outputString
    inc si                  ; Move to the next character in inputString
    inc di                  ; Move to the next character in outputString
    jmp convertLoop         ; Repeat the loop

endConversion:
    mov ah, 4ch             ; DOS function: terminate program
    int 21h

main endp
end main
