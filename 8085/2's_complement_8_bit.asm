LDA 1080H  ; Load the value from memory
CMA        ; 1's complement
INR A      ; Add 1 to get 2’s complement
STA 1081H  ; Store the result
HLT        ; Halt
