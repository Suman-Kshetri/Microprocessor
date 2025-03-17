include 'emu8086.inc'

.stack 100h
.model small

.data


.code
    main proc
        print 'Enter the first number: '
        
        mov ah, 01h
        int 21h
        
        mov bl,al
        sub bl,48
        
        mov dl,10       ;new line
        mov ah, 02h
        int 21h
        
        mov dl,13       ;carriage return
        mov ah, 02h
        int 21h
        
        print 'Enter the second number: '
        mov ah, 01h
        int 21h
        sub al, 48
        
        mul bl          ;al <- al*bl
        mov bl, al
        add bl,48
        
        mov dl,10       ;new line
        mov ah, 02h
        int 21h
        
        mov dl,13       ;carriage return
        mov ah, 02h
        int 21h
        
        print 'The product of two numbers is: '
        
        mov dl ,bl
        mov ah, 02h
        int 21h
        
    main endp

end main
        
       