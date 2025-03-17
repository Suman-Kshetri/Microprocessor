; -------------------- INCLUDE EMU8086 LIBRARY --------------------
; This library provides additional macros and functions for easier programming in emu8086.
include 'emu8086.inc'  

; -------------------- MEMORY MODEL DEFINITION --------------------
.model small       ; Use the "small" memory model (one segment for code & data)

; -------------------- DATA SEGMENT --------------------
.data  
    n db ?        ; Declare a 1-byte variable 'n' to store the user-input character

; -------------------- CODE SEGMENT --------------------
.code  
main proc  
    ; -------------------- SEGMENT INITIALIZATION --------------------
    mov ax, @data   ; Load the address of the data segment into AX
    mov ds, ax      ; Copy the address in AX to DS (initialize data segment)
      
    ; -------------------- PRINT PROMPT MESSAGE --------------------
    print "Enter the character: "  ; Display a prompt message to the user

    ; -------------------- READ CHARACTER FROM USER --------------------
    mov ah, 01h     ; DOS interrupt 21h, function 01h (read character with echo)
    int 21h         ; Read a character from keyboard, store it in AL

    ; -------------------- STORE CHARACTER IN MEMORY --------------------
    mov n, al       ; Store the entered character in variable 'n'

    ; -------------------- PRINT ENTERED CHARACTER --------------------
    mov dl, al      ; Move the character into DL (used for printing)
    mov ah, 02h     ; DOS interrupt 21h, function 02h (print character)
    int 21h         ; Print the entered character

    ; -------------------- PRINT NEW LINE --------------------
    mov dl, 0Dh     ; ASCII code for Carriage Return (CR) - Moves cursor to the beginning of the line or 13h
    mov ah, 02h
    int 21h

    mov dl, 0Ah     ; ASCII code for Line Feed (LF) - Moves cursor to the next line or 10h
    mov ah, 02h
    int 21h

    ; -------------------- PRINT OUTPUT MESSAGE --------------------
    print "Your character is: "  ; Display message to show the stored character

    ; -------------------- PRINT STORED CHARACTER --------------------
    mov dl, n       ; Load the stored character into DL for printing
    mov ah, 02h     ; DOS interrupt 21h, function 02h (print character)
    int 21h         ; Print the stored character

    ; -------------------- EXIT PROGRAM --------------------
    mov ah, 04Ch    ; DOS interrupt 21h, function 4Ch (terminate program)
    int 21h         ; Exit program

main endp  
end main  
