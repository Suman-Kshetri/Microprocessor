LXI H, 1080H       ; Load the address of the memory locations for the operands
MOV B, M           ; Load the first number (6) into B
MVI A, 00H         ; Clear the accumulator to ensure no garbage value
MVI C, 00H         ; Clear carry
INX H              ; Point to the next memory location
MOV D, M           ; Load the second number (4) into D

MOV E, B           ; Copy the first number into E (for result)

NEXT2:
ADD E              ; A = A + E
DCR D              ; Decrease D (loop counter for the second operand)
JNZ NEXT2          ; Repeat if D is not zero

STA 1083H          ; Store the result in 1083H
MOV A, C           ; Move carry into A
STA 1082H          ; Store the carry in 1082H
HLT                ; Halt the program
