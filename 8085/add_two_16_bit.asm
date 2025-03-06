;A645H , load the 45H in 1080H and A6H in 1081H
;9B23H, load the 23H in 1082H and 9BH in 1083H

;add the two 16 bit numbers and store the result in 1084H and 1085H

LHLD 1080H;  load the 16-bit data stored at a specific memory address into the HL register pair.
XCHG ; To store the content of the HL register pair in the DE register pair.

LHLD 1082H;  load the 16-bit data stored at a specific memory address into the HL register pair.

DAD D;  add the content of the DE register pair to the HL register pair.[Double addition]

MVI C,00H;  initialize the C register with 00H [i.e no carry]

JNC loop; if there is no carry then jump to the label loop
INR C; if there is a carry then increment the register C by 1

loop: SHLD 1084H;  store the 16-bit data stored in the HL register pair at a specific memory address.
      MOV A, C;  move the content of the C register to the accumulator.
      STA 1086H;  store the 8-bit data stored in the accumulator at a specific memory address.
      HLT;  halt the program