LXI H, 2000H  ; Load HL with memory address 2000H
MOV A, M      ; Load number from memory into A
MVI B, 08H    ; 8-bit number (loop counter)
MVI C, 00H    ; Initialize count of 1s to 0

LOOP: RAR     ; Rotate A right, LSB moves to carry
JNC NEXT      ; If Carry = 0, skip increment
INR C         ; Increment count of 1s if Carry = 1

NEXT: DCR B   ; Decrement bit counter
JNZ LOOP      ; Repeat until all 8 bits are checked

MOV A, C      ; Move final count to A
STA 2005H     ; Store the result at memory 2005H

HLT           ; Halt program
