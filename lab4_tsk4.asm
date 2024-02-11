.ORIG x3000

LEA R0, HS
PUTS

LEA R1, STRING

INP
    GETC
    OUT

    LD R2, LINE; check end
    ADD R2, R2, R0
    BRz SORTOUT

    LD R2, ZERO; refrac from ascii
    ADD R0, R0, R2 
    STR R0, R1, #0
    ADD R1, R1, #1
    BRnzp INP

SORTOUT
    LEA R1, STRING
    LD R0, NCNTR; outter cntr
    ADD R0, R7, R0; check swap count
    BRz LOAD

    LD R7, CNTR; zeroing swap cntr
    LD R4, CNTR; zeroing inner cntr

    ADD R2, R1, #0; dig 1 adr
    ADD R3, R1, #1; dig 2 adr
    ADD R4, R4, #0; cntr

SORTIN

    LDR R5, R2, #0; dig 1
    LDR R6, R3, #0; dig 2

    NOT R6, R6; negative digit
    ADD R6, R6, #1

    ADD R0, R5, R6; compare
    BRnz SKIP
    BRp SWAP


SKIP
    ADD R6, R6, #-1; positive again
    NOT R6, R6

    ADD R2, R2, #1; move adr
    ADD R3, R3, #1 

    ADD R4, R4, #-1; decr cntr
    BRz SORTOUT
    BRp SORTIN

SWAP
    ADD R7, R7, #-1

    ADD R6, R6, #-1; positive again
    NOT R6, R6

    STR R6, R2, #0; swap
    STR R5, R3, #0

    BRnzp SORTIN

LOAD
    LEA R1, STRING
    LD R2, PZERO
    LD R3, NCNTR

SHOW
    LDR R0, R1, #0
    ADD R0, R0, R2
    ADD R1, R1, #1
    OUT
    ADD R3, R3, #1
    BRp STOP
    BRnzp SHOW  

STOP
    HALT

HS .STRINGZ "Pls, input a 10-digit string in random order without any separators: "

STRING .BLKW #100
CNTR .FILL #9
NCNTR .FILL #-9

LINE .FILL  #-10; new line
ZERO .FILL #-48; -0
PZERO .FILL #48; +0

.END