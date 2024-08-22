.model small
.stack 100h
.data
    array db 10 dup(?) ; Maximum length of the input string
    buffer db 11 dup(?) ; Buffer to store the input string
    newline db 13, 10, "$" ; Newline characters

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt
    lea dx, buffer
    mov ah, 0Ah
    int 21h

    ; Copy the input string from the buffer to array
    mov si, offset buffer + 2 ; Skip the length byte in the buffer
    mov di, offset array
    mov cx, 10
    rep movsb

    ; Display the original string
    mov dx, offset array
    mov ah, 9
    int 21h

    ; Display each character on a new line
    mov si, offset array
    mov cx, 10
    l1:
        mov dl, [si]
        mov ah, 2
        int 21h

        ; Move to the next line
        mov dx, offset newline
        mov ah, 9
        int 21h

        inc si
        loop l1

    ; Exit the program
    mov ah, 4Ch
    int 21h
main endp
end main
