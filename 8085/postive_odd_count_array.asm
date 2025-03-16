LXI H, 1080H        ; Load register H with address 1080H (start of memory location for the data)
MOV C, M            ; Move the value at memory address 1080H into register C (this is the number of elements)
MVI D, 00H          ; Initialize D register to 00H, to count the positive odd numbers

CONTINUE: INX H     ; Increment HL pair, H now points to the next memory address
MOV A, M            ; Move the value at memory address (HL) to the accumulator (A)
RAL                 ; Rotate A left through carry (MSB -> carry and carry to LSB)
JC NEXT             ; Jump to NEXT if the carry is set (meaning the number is negative)

RAR                 ; Rotate A right through carry (moving MSB to carry, and carry to LSB)
STC                 ; Set the carry flag (this makes carry = 1)
CMC                 ; Complement the carry flag (this makes carry = 0)
RAR                 ; Rotate A right again through carry

JNC NEXT            ; Jump to NEXT if carry is not set (this means the number is even)

INR D               ; Increment D if the number is positive and odd
NEXT: DCR C         ; Decrement C (counter for the total number of elements)
JNZ CONTINUE        ; Jump back to CONTINUE if C is not zero (i.e., if there are more numbers to check)

MOV A, D            ; Move the count of positive odd numbers (in D) to the accumulator
STA 1100H           ; Store the result (count of positive odd numbers) in memory 1100H

HLT                 ; Halt the program
