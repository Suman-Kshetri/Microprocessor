include 'emu8086.inc'

.model small

.stack 100h

.data
    string db 'sumanKshetri'
    

.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov si, offset string
        mov cx, 12
        
        instack:
            mov bx , [si]
            push bx
            inc si
            loop instack

        mov cx,12
        
        outstack:
            pop dx;
            mov ah, 02h
            int 21h
            loop outstack
            
       main endp 
    
end main

;or
;include 'emu8086.inc'

;.model small

;.stack 100h

;.data
;    string db 'sumanKshetri'
   

;.code
;    main proc
;        mov ax, @data
;        mov ds, ax
        
;        mov si, offset string
;        mov cx, 12
        
;        instack:
;            mov bx , [si]
;            push bx
;            inc si
;            dec cx
;            jnz instack

;        mov cx,12
        
;        outstack:
;            pop dx;
;            mov ah, 02h
;            int 21h
;            dec cx
;            jnz outstack
            
;       main endp 
    
;end main