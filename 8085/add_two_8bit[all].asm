;input the  05H in 1000H memory location
;input the  07H in 1001H memory location

LXI H, 1000H ;loading the memory location 1000H in the HL pair
MOV A, M ; Movinng the content of the memory location 1000H to the accumulator

INX H ; Increasing the HL pair by one [i.e 1000H to 1001H]

ADD M ; Adds the value stored at the memory location (HL) to the accumulator (A register) and stores the result in A
; M refers to the memory location pointed to by the HL register pair.

STA 1002H ; Storing the result in the memory location 1002H from the accumulator
HLT ; halt the program