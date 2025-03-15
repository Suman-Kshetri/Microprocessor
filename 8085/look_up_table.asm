LDA 4080H      ; Load the byte from memory location 4080H into accumulator A
MOV L, A       ; Move the value from A to register L
MVI H, 10H     ; Load register H with the immediate value 10H
MOV A, M       ; Move the value stored at memory location (HL) into accumulator A
STA 4081H      ; Store the value of A into memory location 4081H
HLT            ; Halt execution
