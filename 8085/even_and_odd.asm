;finding the even and odd number:

LDA 1080H   ; Load the number from memory location 1080H into accumulator A.
RAR         ; Rotate right through carry (LSB moves into carry flag).
JC ODD      ; If carry (CY = 1), jump to ODD (meaning the number is odd).

; If control reaches here, the number is even
MVI A, 00H  ; Load A with 00H (indicating even)
STA 1081H   ; Store result at 1081H
HLT         ; Halt the program

ODD: 
MVI A, 01H  ; Load A with 01H (indicating odd)
STA 1081H   ; Store result at 1081H
HLT         ; Halt the program
