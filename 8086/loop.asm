INCLUDE 'EMU8086.INC'

.STACK 100H
.DATA

.CODE
    MAIN PROC
        PRINT 'Nautral Number: '
                                
        MOV DL, 10    ; NEW LINE      
        MOV AH, 02H
        INT 21H
        
        MOV DL, 13   ; CARRIAGE RETURN
        MOV AH, 02H
        INT 21H
        
        mov cx,10
        
        mov bl,1
        start:
            mov dl, bl
            add dl, 48
            
            mov ah, 02h
            int 21h
            
            
            MOV DL, 10    ; NEW LINE      
            MOV AH, 02H
            INT 21H
            
            MOV DL, 13   ; CARRIAGE RETURN
            MOV AH, 02H
            INT 21H
            
            inc bl
         loop start
        
        
    MAIN ENDP
END MAIN
