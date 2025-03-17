include 'emu8086.inc'

.stack 100h
.data
    array1 db 2,4,7,8,1
    array2 db 2,4,7,9,1

.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov si, offset array1
        mov di, offset array2
        
        mov cx,5
        
        loopx:
            mov al, [si]
            mov bl, [di]
            
            cmp al, bl
            
            jne notequal
                inc si
                inc di
            
        loop loopx
        
            print 'Both the array have same elements'
            mov ah, 04ch
            int 21h
            
        notequal: 
            print 'array do not have the same elements'
            mov ah,04ch
            int 21h
            
         main endp
    end main