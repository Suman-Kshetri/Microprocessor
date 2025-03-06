;Whatever the operation is going to perfrom that is 
;performed in the content of the accumulator and the result is stored in the accumulator

MVI A,02H ; initializing the accumulator with 02H
MVI B, 03H ;initializing the register B with 03H

ADD B ;adding the content of register B to the accumulator and storing the result in the accumulator

STA 1050H ;storing the result in the memory location 1050H from the accumulator
HLT ;halt the program

;in the program only the two number are added