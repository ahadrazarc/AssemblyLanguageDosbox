.model small
.stack 100h

.data
    even_list db '2,4,6,8,10,12,14,16,18,20$'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, even_list

print_loop:
    mov dl, [si]        
    cmp dl, '$'         
    je end_program      
    mov ah, 02h
    int 21h         
    inc si             
    jmp print_loop     

end_program:
    mov ah, 4ch        
    int 21h

    main endp
end main