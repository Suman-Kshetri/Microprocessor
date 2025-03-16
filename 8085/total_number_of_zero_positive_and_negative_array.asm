;finding the total numbe of zero,positive and negative numbers

LXI H, 1080H   ; Load HL with memory address 1080H
MOV C, M       ; Load the number of elements into register C
MVI B, 00H     ; Initialize B to store count of zero numbers
MVI D, 00H     ; Initialize D to store count of positive numbers
MVI E, 00H     ; Initialize E to store count of negative numbers

CONTINUE: INX H  ; Move to the next number in the array
MOV A, M        ; Load the current number into A
ADI 00H         ; Add 00H to A (checking if it's zero)
JZ ZERO         ; If result is zero, jump to ZERO label
JP POSITIVE     ; If A is positive, jump to POSITIVE label
INR E           ; If A is negative (not zero or positive), increment negative count
JMP NEXT        ; Jump to NEXT label

ZERO: INR B     ; Increment zero count
JMP NEXT        ; Jump to NEXT label

POSITIVE: INR D ; Increment positive count

NEXT: DCR C     ; Decrement counter (number of elements left to check)
JNZ CONTINUE    ; If C is not zero, continue checking

MOV A, B        ; Load zero count into A
STA 1100H       ; Store zero count at memory location 1100H
MOV A, D        ; Load positive count into A
STA 1101H       ; Store positive count at memory location 1101H
MOV A, E        ; Load negative count into A
STA 1102H       ; Store negative count at memory location 1102H
HLT             ; Halt execution
