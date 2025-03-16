LXI H, 1800H   ; Load HL with source address 1800H (starting point of data)
LXI D, 1100H   ; Load DE with destination address 1100H
MVI C, 05H     ; Load C with 05H (5 data values to copy)

LOOP: MOV A, M  ; Load the value from memory pointed by HL into A
      STAX D    ; Store the value of A into the memory location pointed by DE
      INX H     ; Increment HL to point to the next source memory location
      INX D     ; Increment DE to point to the next destination memory location
      DCR C     ; Decrease C (loop counter)
      JNZ LOOP  ; If C ≠ 0, repeat the loop

HLT             ; Halt execution
