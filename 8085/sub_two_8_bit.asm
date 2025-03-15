;subtaction of two 8-bit numbers
MVI D, 06H      ; Load 06H into register D (Minuend)
MVI E, 05H      ; Load 05H into register E (Subtrahend)
MOV A, D        ; Move the value of D into Accumulator A
SUB E           ; Subtract E from A (A = A - E)
STA 9006H       ; Store the result from A into memory location 9006H
HLT             ; Halt program execution
