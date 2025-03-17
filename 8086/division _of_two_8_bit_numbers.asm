INCLUDE 'EMU8086.INC'

.STACK 100H
.DATA

.CODE
    MAIN PROC
        PRINT 'ENTER THE FIRST NUMBER: '
        MOV AH, 01H
        INT 21H
        
        SUB AL, 48  ; Convert ASCII to integer
        MOV BL, AL  ; Store first number in BL
                  
        MOV DL, 10    ; NEW LINE      
        MOV AH, 02H
        INT 21H
        
        MOV DL, 13   ; CARRIAGE RETURN
        MOV AH, 02H
        INT 21H
        
        PRINT 'ENTER THE SECOND NUMBER: '
        MOV AH, 01H
        INT 21H
        
        SUB AL, 48  ; Convert ASCII to integer
        MOV CL, AL  ; Store second number in CL

        ; Division operation
        MOV AX, 0   ; Clear AX before division
        MOV AL, BL  ; Move first number to AL (Dividend)
        MOV BL, CL  ; Move second number to BL (Divisor)
        
        DIV BL      ; AL = AL / BL, AH = remainder

        ; Store Quotient and Remainder in BL and BH
        MOV BL, AL  ; Store quotient in BL
        MOV BH, AH  ; Store remainder in BH
        ;OR, MOV BX, AX

        ; NEW LINE      
        MOV DL, 10  
        MOV AH, 02H
        INT 21H
        
        MOV DL, 13   ; CARRIAGE RETURN
        MOV AH, 02H
        INT 21H    
        
        PRINT 'QUOTIENT: '
        
        MOV DL, BL   ; Retrieve stored quotient
        ADD DL, 48   ; Convert to ASCII
        MOV AH, 02H
        INT 21H
        
        ; NEW LINE      
        MOV DL, 10    
        MOV AH, 02H
        INT 21H
        
        MOV DL, 13   ; CARRIAGE RETURN
        MOV AH, 02H
        INT 21H
        
        PRINT 'REMAINDER: '
        
        MOV DL, BH   ; Retrieve stored remainder
        ADD DL, 48   ; Convert to ASCII
        MOV AH, 02H
        INT 21H
        
    MAIN ENDP
END MAIN
