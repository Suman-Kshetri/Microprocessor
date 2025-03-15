;Searching for the given number in the array

LXI H, 1080H   ; Load HL with the starting address of the data
MOV B, M       ; B <- Search key (value to be found)
INX H          ; Move to the next memory location
MOV C, M       ; C <- Number of elements in the array

CONTINUE: INX H      ; Move HL to the next element in the array
          MOV A, M   ; Load the current element into A
          CMP B      ; Compare A (current element) with B (search key)
          JZ FOUND   ; If A == B, jump to FOUND
          DCR C      ; Decrement the counter
          JNZ CONTINUE ; If C ≠ 0, repeat search

; If the number is not found, store 00H at 1100H
MVI A, 00H    ; Load A with 00H (indicating not found)
STA 1100H     ; Store 00H at memory location 1100H
HLT           ; Halt execution

FOUND: MOV A, B  ; Move search key (B) to A
       STA 1100H ; Store found value at 1100H
       HLT       ; Halt execution
