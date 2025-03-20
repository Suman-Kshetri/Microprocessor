; Multiplication of two 8-bit numbers using Shift and Add method
; Example: 05H × 03H

LXI H, 1080H    ; Load memory address 1080H into HL register pair
MOV E, M        ; Move the first operand (multiplicand) from 1080H to register E
INX H           ; Increment HL to point to the next memory location
MOV A, M        ; Move the second operand (multiplier) from 1081H to register A
MVI D, 00H      ; Initialize register D with 00H (used for accumulation)
LXI H, 0000H    ; Initialize HL with 0000H (used to store the result)
MVI B, 08H      ; Load B with 08H (loop counter for 8-bit multiplication)

LOOP:  
    DAD H       ; HL = HL + HL (Shift HL left by one bit, effectively doubling it)
    RAL         ; Rotate A left through carry (shift left, moving MSB into carry)
    JNC SKIP    ; If carry is 0, skip the addition step
    DAD D       ; HL = HL + DE (Add multiplicand E if carry was set)

SKIP:  
    DCR B       ; Decrement loop counter B
    JNZ LOOP    ; Repeat loop until B becomes 0

SHLD 1085H      ; Store the final result (16-bit) at memory address 1085H
HLT             ; Halt execution
