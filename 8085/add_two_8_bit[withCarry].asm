;adding the two 8 bit number which generates a carry

;load the data F1H in memory location 1080H
;load the data 15H in memory location 1081H

LXI H, 1080H ;loading the memory location 1080H in the HL pair
MOV A, M ; Movinng the content of the memory location C050H to the accumulator
INX H ; Increasing the HL pair by one [i.e 1080H to 1081H]

;Considering the register B as the carry register

MVI B, 00H ;initializing the register B with 00H [i,e no carry]
ADD M ; Adds the value stored at the memory location (HL) to the accumulator (A register) and stores the result in A

;to check if there is a carry or not
 JNC loop ;if there is no carry then jump to the label loop
 INR B  ;if there is a carry then increment the register B by 1

loop: STA 1083H  ; Store lower 8 bits of result in memory[1083H]
      MOV A, B       ; Move carry value (B) into A
      STA 1082H      ; Store carry in memory[1082H] 