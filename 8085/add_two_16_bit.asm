; Load the 16-bit data stored at memory addresses 1080H and 1081H into HL (45H, A6H)
LHLD 1080H        ; Load HL with data 45H (at 1080H) and A6H (at 1081H)

; Store HL in DE register pair
XCHG              ; Exchange HL with DE

; Load the 16-bit data stored at memory addresses 1082H and 1083H into HL (23H, 9BH)
LHLD 1082H        ; Load HL with data 23H (at 1082H) and 9BH (at 1083H)

; Add DE to HL, result stored in HL
DAD D             ; HL = HL + DE (16-bit addition)

; Initialize carry register (C) to 00H
MVI C, 00H        ; Clear the C register (no carry)

; Check if carry occurred after the addition (CY flag)
JNC loop          ; Jump if no carry (CY = 0)

; If carry occurred, increment the C register
INR C             ; Increment C by 1 (carry occurred)


; Store the result (HL register pair) into memory (1084H and 1085H)
loop: SHLD 1084H        ; Store HL into memory at 1084H and 1085H

; Move the value of the C register (carry) into the accumulator
MOV A, C          ; Move C into A (Accumulator)

; Store the carry value in memory at 1086H
STA 1086H         ; Store A (C value) at memory address 1086H

HLT                ; Halt the program
