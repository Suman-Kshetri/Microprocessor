include 'emu8086.inc'

.model small
.stack 100h
.data

.code
    main proc
        print 'This is first line'
        
        call newline

        print 'This is second line'
        call newline

        print 'This is third line'
        
        call newline
        
        mov ah,  04ch
        int 21h
        
    main endp

    newline proc
        mov dl, 10
        mov ah, 02h
        int 21h

        mov dl, 13
        mov ah, 02h
        int 21h
        ret
    newline endp
end main