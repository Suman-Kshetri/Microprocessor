include 'emu8086.inc'

.stack 100h
.model small
.data

.code
    main proc
        print 'Enter your Character:'
        
        ;taking the character from user
        mov ah,01h ; data will be stored in the AL register
        int 21h
        
        mov bl,al  ; bl = al
        
        ;10 is the ASCII value of new line
        mov dl, 10 ; new line
        mov ah,02h
        int 21h
        
        ;13 is the ASCII value of Carriage Return -> it will move the cursor to the beginning of the line
        mov dl, 13 ;Carriage Return
        mov ah,02h
        int 21h    
        
        mov dl,bl ; dl = al
        
        print 'Your Character is: '
        
        ;printing the data in new line
        mov ah,02h ; data of the DL register will be printed
        int 21h
        
        
    main endp

end main
