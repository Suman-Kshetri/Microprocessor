LXI H, 1080H   ; Load the memory address 1080H into HL
MOV B, M       ; Load the value at 1080H into register B (Number for factorial)
MVI D, 01H     ; Initialize D with 1 (Factorial starts from 1)

LOOP: CALL MULTIPLY  ; Call subroutine to multiply D by B
DCR B          ; Decrement B
JNZ LOOP       ; If B is not zero, repeat the loop

INX H          ; Increment HL to point to the next memory address
MOV M, D       ; Store the computed factorial at memory location 1081H
HLT            ; Halt execution

; ----------------------------
; MULTIPLY Subroutine (D = D * B)
; ----------------------------
MULTIPLY:MVI A, 00H  ; Clear A (Accumulator) before multiplication
    MOV E, B    ; Copy B into E (Multiplied value)
    
MULT_LOOP: ADD D       ; A = A + D (Repeated addition to simulate multiplication)
    DCR E       ; Decrement E (Repeat for B times)
    JNZ MULT_LOOP
    MOV D, A    ; Store the multiplication result in D
    RET         ; Return from subroutine
