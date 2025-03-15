;C <- number of elements in series (1080H)

LXI H ,1080H      ; Load the base address 1080H into HL.
MOV C,M           ; Load the first memory value (number of elements in series) into register C.
MVI A, 00H        ; Initialize A = 00H (Accumulator for sum).
MVI B, 00H        ; Initialize B = 00H (Carry register).

CONTINUE: INX H   ; Move HL to the next memory location (next number in the series).
ADD M             ; Add the number at memory location (M) to accumulator A.

JNC LOOP          ; If no carry is generated, jump to LOOP.
INR B             ; If carry is generated, increment B (stores carry count).

LOOP: DCR C       ; Decrement C (count of numbers).
JNZ CONTINUE      ; If C is not zero, repeat addition process.

STA 4080H         ; Store the lower 8 bits of the sum at memory location 4080H.
MOV A,B           ; Move carry (B) to accumulator.
STA 4081H         ; Store carry at memory location 4081H.
HLT               ; Halt the program.
