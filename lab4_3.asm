.ORIG x3000

;R0 - work
;R1 - storage
;R2 - ascii code
;R3 - 

LEA R0, HS
PUTS
LEA R1, STRG
LEA R3, ARR


STORE
    GETC
    OUT

    LD R2, LINE
    ADD R2, R2, R0
    BRz STOP

    LD R2, SPC
    ADD R2, R2, R0
    BRz NEXT

    LD R2, ZERO
    ADD R0, R0, R2
    STR R0, R1, #0 
    ADD R1, R1, #1
    BRnzp STORE

NEXT
    LEA R1, STRG



    ;ADD R0, R0, #0
    LD R1, ONE
    LD R2, TWO
    ADD R3, R0, #1
    NOT R4, R0

    MULT1
        AND R2, R2, R4
        BRz STOP
        AND R5, R2, R3
        BRz MULT2
        ADD R0, R0, R1

    MULT2
        ADD R1, R1, R1
        ADD R3, R3, R3
        ADD R4, R4, R4
        BRnzp MULT1


STOP
    HALT


HS .STRINGZ "Pls enter 10 numbers: "

ZERO .FILL #-48; 0
SPC .FILL  #-32; space bar
LINE .FILL  #-10; new line

STRG .BLKW #4
ARR .BLKW #21



.END