INCLUDE 'EMU8086.INC'

.STACK 100H
.DATA

  

.CODE
    MAIN PROC
        PRINT 'ENTER THE FIRST NUMBER: '
       MOV AH, 01H
       INT 21H
       MOV BL, AL
       
       MOV DL,10
       MOV AH, 02H
       INT 21H
       
       MOV DL, 13
       MOV AH, 02H
       INT 21H
        
        PRINT 'ENTER THE SECOND NUMBER: '
       MOV AH, 01H
       INT 21H
       MOV CL, AL
       
       MOV DL,10
       MOV AH, 02H
       INT 21H
       
       MOV DL, 13
       MOV AH, 02H
       INT 21H
       
       CMP BL, CL
       
       JE EQUAL         ;BL=CL  
       JG GREATER       ;BL>CL
       JL SMALLER       ;BL<CL
       
       EQUAL: PRINT ' BOTH THE NUMBER ARE EQUAL !!'
       MOV AH, 04CH
       INT 21H
       
       GREATER: PRINT 'FIRST NUMBER IS THE LARGEST !!'
       MOV AH, 04CH
       INT 21H
       
       SMALLER: PRINT 'SECOND NUMBER IS THE LARGEST !!'
       MOV AH, 04CH
       INT 21H
        
    MAIN ENDP
END MAIN
