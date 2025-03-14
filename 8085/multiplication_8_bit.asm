;multiplication of 06H and 04H

LXI H,1080H
MOV B, M ; string the first number
MVI A ,00H ; to ensure that the acumulator doesn't contain garvage value
MVI C ,00H ; carry
INX H ; to point to the next memory location
MOV D, M ; to store the value of the second number

NEXT2: ADD B ; A=A+B
JNC NEXT
INR C ; if carry is generated

NEXT: DCR D;
JNZ NEXT2 ; jump to the next line if D is not zero
STA 1083H ; store the result in 1083H
MOV A,C ; move the carry to A
STA 1082H ; store the carry in 1082H
HLT