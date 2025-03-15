LXI H, 1080H         ; Load the address 1080H into HL. HL points to the memory location where the number is stored.
MOV A, M             ; Load the content of memory location 1080H into the accumulator A (A = M).
RAL                  ; Rotate left through carry. The MSB (D7) moves into the carry flag (CY), and the carry moves into LSB (D0).
JNC POSITIVE         ; Jump to POSITIVE if the carry (CY) is 0 (MSB = 0, indicating a positive number).
MVI A, 01H           ; Load immediate value 01H into accumulator A (A = 01H).
STA 1081H            ; Store the value in A (01H) into memory location 1081H (indicating negative number).
HLT                  ; Halt the program.

POSITIVE: MVI A, 00H ; Load immediate value 00H into accumulator A (A = 00H).
STA 1081H            ; Store the value in A (00H) into memory location 1081H (indicating positive number).
HLT                  ; Halt the program.


;The MSB (Most Significant Bit) of the number is checked by rotating the accumulator using the RAL instruction.
;in RAL instruction:    The leftmost bit (D7) moves into carry flag (CY).
                        ;The carry flag (CY) moves into the rightmost bit (D0).
;If the carry flag (CY) is 0, the number is positive and 00H is stored at 1081H.
;If the carry flag (CY) is 1, the number is negative and 01H is stored at 1081H.