;only gives the sum output to the 9 


include 'emu8086.inc'  ; Include emu8086 library for print macros
.stack 100h  ; Allocate stack space

.data  ; Data segment (no variables needed)

.code  
main proc  
    print 'Enter the first number: '  ; Display prompt message

    mov ah, 01h      ; Read a character from keyboard (DOS interrupt 21h, function 01h)
    int 21h          
    sub al, 48       ; Convert ASCII digit to integer (0-9)

    mov bl, al       ; Store the first number in BL

    mov dl, 0Dh      ; Carriage Return (moves cursor to the start of the line)
    mov ah, 02h
    int 21h

    mov dl, 0Ah      ; Line Feed (moves cursor to the next line)
    mov ah, 02h
    int 21h

    print 'Enter the second number: '  ; Display prompt message for second number

    mov ah, 01h      ; Read second number from keyboard
    int 21h
    sub al, 48       ; Convert ASCII digit to integer (0-9)

    add bl, al       ; Add first and second number, result stored in BL

    mov dl, 13     ; Carriage Return (CR)
    mov ah, 02h
    int 21h

    mov dl, 10       
    mov ah, 02h
    int 21h

    print 'The sum of the two numbers is: '  ; Display message before printing sum

    add bl, 48       ; Convert integer result back to ASCII
    mov dl, bl       ; Move result to DL for printing

    mov ah, 02h      ; Print the sum as a single character
    int 21h  

    mov ah, 4Ch      ; Exit program (DOS interrupt 21h, function 4Ch)
    int 21h  

main endp  
end main  
