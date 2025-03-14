; Program to divide an 8-bit number stored at memory location 1080H 
; by another 8-bit number stored at memory location 1081H.
; The quotient is stored at 1082H, and the remainder is stored at 1083H.

LXI H, 1080H   ; Load HL register pair with memory address 1080H
MOV B, M       ; Move the dividend (numerator) from memory into register B
MVI A, 00H     ; Clear register A (accumulator)
INX H          ; Increment HL to point to 1081H (denominator)
MOV C, M       ; Move the divisor (denominator) from memory into register C

MVI D, 00H     ; Initialize D register to 0 (D will store the quotient)
MOV A, B       ; Copy dividend from B to A for subtraction

LOOP: SUB C    ; Subtract divisor (C) from dividend (A)
INR D          ; Increment quotient (D) since one division step is done

CMP C          ; Compare A with C
JNC LOOP       ; If A >= C, continue subtracting (jump to LOOP)

STA 1083H      ; Store the remainder (A) at memory location 1083H
MOV A, D       ; Move quotient (D) to A
STA 1082H      ; Store the quotient at memory location 1082H
HLT            ; Halt execution
