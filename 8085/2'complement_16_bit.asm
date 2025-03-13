; 2's complement of 16 bit number: 4F00H 

LXI H, 1080H  ; Load address 1080H into HL register pair
MVI B, 00H    ; Initialize B register (used to handle carry)
MOV A, M      ; Load LSB (1080H) into A
CMA           ; 1's complement of A
ADI 01H       ; Add 1 to compute 2’s complement (LSB)
STA 1082H     ; Store result in 1082H

JNC NEXT      ; If no carry is generated, jump to NEXT
INR B         ; If carry is generated, increment B

NEXT: INX H   ; Move to next memory location (MSB at 1081H)
MOV A, M      ; Load MSB into A
CMA           ; 1’s complement of A
ADD B         ; Add carry bit (0 or 1) to MSB
STA 1083H     ; Store result in 1083H
HLT           ; Halt
