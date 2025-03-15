LXI H, 1080H   ; Load memory address 1080H into HL
MOV B, M       ; Load the value from 1080H into register B (B = A)
INX H          ; Increment HL to point to 1081H
MOV C, M       ; Load the value from 1081H into register C (C = B)

MOV A, B       ; Move A into Accumulator
ORA C          ; Perform A OR B → A = A + B
CMA            ; Complement A (NOT operation)
STA 1082H      ; Store result of (A + B)' at memory 1082H

MOV A, B       ; Load B into Accumulator
CMA            ; Complement A (A' = NOT B)
MOV D, A       ; Store A' in D

MOV A, C       ; Load C into Accumulator
CMA            ; Complement A (B' = NOT C)
ANA D          ; Perform A' AND B' (A' . B')
STA 1083H      ; Store the result of A'.B' at memory 1083H

HLT            ; Halt execution
