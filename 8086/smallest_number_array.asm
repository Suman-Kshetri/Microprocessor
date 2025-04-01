include 'emu8086.inc'
.model small
.stack 100h
.data
    array db 5,3,2,1,8  ; Array of 5 elements

.code
    main proc
        mov ax, @data
        mov ds, ax

        mov si, offset array  ; Point to the start of the array
        mov cx, 5             ; Array length
        mov bl, [si]          ; Assume first element is the smallest
        inc si                ; Move to the second element

    loopresume:
        cmp [si], bl          ; Compare current element with smallest
        jl update             ; If smaller, update bl
        jmp next              ; Otherwise, move to next element

    update:
        mov bl, [si]          ; Update smallest value

    next:
        inc si                ; Move to next element
        loop loopresume       ; Repeat until CX = 0

        print "smallest number is: "
        add bl, 48            ; Convert to ASCII
        mov dl, bl
        mov ah, 02h
        int 21h

        mov ah, 4Ch           ; Exit program
        int 21h

    main endp
end main
