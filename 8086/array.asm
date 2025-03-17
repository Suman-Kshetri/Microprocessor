INCLUDE 'EMU8086.INC'  ; Include emulator library for printing

.STACK 100H  ; Define stack size

.DATA
    Array DB 3,5,6,1,2,9,8  ; Define an array with 7 elements

.CODE
    MAIN PROC
        ; Load data segment address into DS register
        mov ax, @data  
        mov ds, ax
        
        ; Load the address of the array into SI (index register)
        mov si, offset Array  
                                             
        ; Set loop counter to 7 (number of elements in the array)
        mov cx, 7  
        
        ; Print the message "Array Elements: "
        PRINT 'Array Elements : ' 
        
        start:
            ; Load the current array element into DL
            mov dl, [si]
            
            ; Convert the number to its ASCII representation (by adding 48)
            add dl, 48
            
            ; Print the ASCII character of the number
            mov ah, 02h
            int 21h
            
            ; Print a space (ASCII 32) to separate numbers
            MOV DL, 32    
            MOV AH, 02H
            INT 21H
            
            ; Move to the next array element
            inc si
            
            ; Loop until CX becomes zero
         loop start
        
    MAIN ENDP
END MAIN
