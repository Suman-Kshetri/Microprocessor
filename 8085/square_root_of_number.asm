LDA 1080H     ; Load N from memory
MVI D, 01H    ; D = 1 (First odd number)
MVI E, 01H    ; E = 1 (Square root counter)

CONTINUE: SUB D    ; A = A - D
JZ EXIT           ; If A = 0, exit loop
INR E            ; Correctly increment E **only after successful subtraction**
INR D            ; 
INR D            ; Move to the next odd number (D = D + 2)
JMP CONTINUE

EXIT: MOV A, E    ; Store result in A
STA 1081H         ; Save the result in memory
HLT               ; Halt
