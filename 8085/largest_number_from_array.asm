;Finding the largest number from the array

LXI H, 1080H   ; Load HL with memory address 1080H
MOV C, M       ; Store the number of elements in register C
INX H          ; Move to the first element of the array
DCR C          ; Decrement C, since the first element is already considered
MOV A, M       ; Load the first element into A (assume it's the largest)

CONTINUE: INX H  ; Move to the next element in the array
CMP M          ; Compare A with the current memory value (A - M)
JNC LOOP       ; If A >= M, continue (A remains the largest)
MOV A, M       ; If A < M, update A with the new larger value

LOOP: DCR C    ; Decrement the counter (number of elements left to check)
JNZ CONTINUE   ; If C is not zero, continue the loop

STA 1100H      ; Store the largest number found in memory location 1100H
HLT            ; Halt execution

;To find the smallest number in the array, you can modify the code as follows:
;JC LOOP       ; If A < M, update A with the new smaller value