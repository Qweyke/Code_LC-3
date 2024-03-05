.ORIG x3000

LEA R1, ARR; filling in ARR with zero el-s:
LD R2, ZERO
ADD R3, R3, #10

FILLING_ARR
    
    STR R2, R1, #0
    ADD R1, R1, #1
    ADD R3, R3, #-1
    BRp FILLING_ARR

LEA R0, HS; start: 
PUTS
AND R0, R0, #0

PREPARE; loading R-s
    
    LEA R7, ARR
    LEA R6, STOR
    LEA R5, MLTPS

    

    AND R0, R0, #0
    
MULT; multiplying every base of the number 
    

    LDR R1, R6, #0; digit (cntr)
    LDR R2, R5, #0; multiplyer
    ADD R4, R2, R2; res
    ADD R1, R1, #-1; decr digit (cntr)
    BRnp MULT 

REMULT; shift next digit base in STOR 

    ADD R6, R6, #1
    ADD R5, R5, #1

    PUTS

    LDR R1, R6, #0; spc check
    LD R2, SPC
    ADD R1, R1, R2

    BRz FILL
    BRnp MULT

FILL; fill in array with number

    ADD R6, R6, #1; spc shift
    LEA R5, MLTPS

    STR R4, R7, #0; store result 
    AND R4, R4, #0; clear
    ADD R7, R7, #1    

    ADD R0, R0, #1; incr num cntr
    LD R1, ARRCNTR
    ADD R2, R0, R1

    BRnp MULT
    BRz PREP

PREP; prepare for division the number on its bases

    LEA R7, ARR
    LEA R6, NMLTPS
    AND R0, R0, #0

DIV; division by digit base

    AND R4, R4, #0; clear compare

    LDR R1, R7, #0; num
    LDR R2, R6, #0; -

    ADD R4, R1, R2; compare
    BRnz PRESHOW

    ADD R1, R1, R2; num
    STR R1, R7, #0
    ADD R0, R0, #1; qnty of digits

    BRnzp DIV

PRESHOW

    LD R1, AZERO
    ADD R0, R0, R1
    OUT

    ADD R7, R7, #1; shifts
    ADD R6, R6, #1
    AND R0, R0, #0
    
    AND R4, R4, #0; for basese compare
    ADD R4, R4, #-4
    ADD R5, R5, #1; cntr for digit bases
    ADD R4, R4, R5
    BRz STOP     
    BRnp DIV

STOP

    HALT

HS .STRINGZ "Pls, input ten 4-digit numbers: "; start
HS1 .STRINGZ  "Entered"

ZERO .FILL #0; filling arr with zero el-s
ARRCNTR .FILL #-2; ЗАМЕНИ #-10?

AZERO .FILL #48
NAZERO .FILL #-48
ENDLINE .FILL #-10
SPC .FILL #16

ARR .BLKW #2; ЗАМЕНИ #10?

STOR .FILL #2
.FILL #3
.FILL #4
.FILL #3
.FILL #-16
.FILL #5
.FILL #1
.FILL #3
.FILL #2

MLTPS .FILL #1000
.FILL #100
.FILL #10
.FILL #1

NMLTPS .FILL #-1000
.FILL #-100
.FILL #-10
.FILL #-1

.END