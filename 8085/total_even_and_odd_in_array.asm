LXI H, 1080H   ; Load HL with memory address 1080H
MOV C, M       ; Load the number of elements into register C
MVI B, 00H     ; Initialize B to store the count of even numbers
MVI D, 00H     ; Initialize D to store the count of odd numbers

CONTINUE: INX H  ; Move to the next element in the array
MOV A, M        ; Load the current element into A
RAR             ; Rotate right through carry (LSB moves to Carry)

JC ODD          ; If carry is set (LSB = 1), number is odd, jump to ODD
INR B           ; Increment even number count
JMP EXIT        ; Jump to EXIT to skip odd count increment

ODD: INR D      ; Increment odd number count

EXIT: DCR C     ; Decrement counter (number of elements left to check)
JNZ CONTINUE    ; If C is not zero, continue the loop

MOV A, B        ; Load even count into A
STA 1100H       ; Store even count at memory location 1100H
MOV A, D        ; Load odd count into A
STA 1101H       ; Store odd count at memory location 1101H
HLT             ; Halt execution

;for the calcualtion of positive and negative numbers in an array we can use RAL instruction