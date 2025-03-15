;Finding the largest number between two 8-bit numbers stored in memory locations 1080H and 1081H, and storing the result in memory location 1082H.

LXI H, 1080H   ; Load HL with memory address 1080H
MOV A, M       ; Load the first number from 1080H into register A
INX H          ; Increment HL to point to the next memory location (1081H)
MOV B, M       ; Load the second number from 1081H into register B
CMP B          ; Compare A with B (A - B)
JNC NEXT       ; Jump to NEXT if A >= B (No Carry means A is greater or equal)
MOV A, B       ; If A < B, move B into A (A now holds the larger number)

NEXT: STA 1082H  ; Store the larger number at memory location 1082H
HLT             ; Halt execution


;For Finding the smallest number between two 9-bit number:
;instead of JNC use JC (Jump if Carry): since  if A < B, the carry flag will be set.