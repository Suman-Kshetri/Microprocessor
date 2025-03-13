;  If the number is 2526 26-> 1080h and 25-> 1081h

LXI H, 1080H; store the address of 26 in H 
MOV A, M ; move the value of 25 to Accumulator
CMA ; 1's complement of 25
STA 1082H ; store the result in 1082h

INX H ; increment the address of 25 to 26 [ie: 1081h]
MOV A, M
CMA ; 1's complement of 26
STA 1083H ; store the result in 1083h
HLT ; halt
