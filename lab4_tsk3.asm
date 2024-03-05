.ORIG x3000

LEA R0, HS; start: 
PUTS
AND R0, R0, #0

LEA R1, STOR; getting digits for STOR:

GETTING
    
    GETC
    OUT

    LD R2, ENDLINE; check end
    ADD R2, R2, R0
    BRz PREPARE1

    LD R2, NAZERO; refrac from ascii
    ADD R0, R0, R2 
    STR R0, R1, #0
    ADD R1, R1, #1
    BRnzp GETTING

PREPARE1; loading R-s

    LEA R7, ARR
    LEA R6, STOR
    LEA R5, MLTPS
    AND R0, R0, #0
    
PREMULT; load next digit and mltplr

    LDR R1, R6, #0; digit (cntr)
    LDR R2, R5, #0; multiplyer

MULT; multiplying every base of the number 

    ADD R1, R1, #-1; decr digit (cntr)
    BRn REMULT 
 
    ADD R4, R4, R2; res
      
    BRnzp MULT 

REMULT; shift next digit base in STOR 

    ADD R6, R6, #1
    ADD R5, R5, #1

    LDR R1, R6, #0; spc check
    LD R2, SPC
    ADD R1, R2, R1
    BRz FILL

    BRnzp PREMULT

FILL; fill in array with number
   
    LEA R5, MLTPS; renew MLTPS pos

    STR R4, R7, #0; store result 
    
    ADD R7, R7, #1
    AND R4, R4, #0; clear 

    ADD R3, R3, #1; incr num cntr
    LD R1, ARRCNTR; check end of cntr
    ADD R2, R3, R1
    BRz SORTOUT

    ADD R6, R6, #1; spc shift

    BRnzp PREMULT

SORTOUT

    LEA R1, ARR

    LD R0, ARRCNTR; marker occurances check
    ADD R0, R0, #1; (qnty of arr el-s) - 1
    ADD R0, R7, R0; check occur-s, if 0 go out
    BRz PREPARE2

    LD R7, CNTR; zeroing swap cntr
    LD R4, CNTR; zeroing inner cntr

    ADD R2, R1, #0; num 1 adr
    ADD R3, R1, #1; num 2 adr

SORTIN

    LDR R5, R2, #0; num 1
    LDR R6, R3, #0; num 2

    NOT R6, R6; add minus to number
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
    ADD R7, R7, #-1; marker

    ADD R6, R6, #-1; positive again
    NOT R6, R6

    STR R6, R2, #0; swap
    STR R5, R3, #0

    BRnzp SORTIN

PREPARE2; prepare for division the number on its bases

    AND R3, R3, #0; clear R3

    LEA R7, ARR
    LEA R6, MLTPS

    LDR R1, R7, #0; num

DIV; division by digit base

    AND R4, R4, #0; clear compare
    
    LDR R2, R6, #0; minus mltpls
    NOT R2, R2
    ADD R2, R2, #1

    ADD R4, R1, R2; compare
    BRn PRESHOW

    ADD R1, R1, R2; num
    ADD R0, R0, #1; qnty of digits
    
    BRnzp DIV

PRESHOW; output

    LD R2, AZERO; print
    ADD R0, R0, R2
    OUT
    AND R0, R0, #0

    ADD R1, R1, #0; check remaining digits
    BRz RELOAD  

    ADD R6, R6, #1; move mltpl    

    BRnzp DIV

RELOAD; load next number, check end

    LD R0, ASPC; divide num-s by spc
    OUT
    AND R0, R0, #0

    ADD R3, R3, #1; incr num cntr
    LD R2, ARRCNTR; check end of cntr
    ADD R2, R3, R2
    BRz STOP

    LEA R7, ARR; shift array on 1 pos (why this fckn lc-3 is clearing Registers so unobviously?????? )
    ADD R7, R7, R3
    LDR R1, R7, #0
    
    LEA R6, MLTPS

    BRnzp DIV

STOP
    ADD R0, R0, #10
    OUT
    LEA R0, GB
    PUTS
    HALT

HS .STRINGZ "Pls, input ten 4-digit numbers: "; start
GB .STRINGZ "Let LC-3 burn in hell :)"

ARRCNTR .FILL #-5; CHANGE #-10
CNTR .FILL #4; CHANGE # QNTY - 1

AZERO .FILL #48
NAZERO .FILL #-48
ENDLINE .FILL #-10
SPC .FILL #16
ASPC .FILL #32

ARR .BLKW #5; CHANGE #10?
STOR .BLKW #25; CHANGE #50

MLTPS .FILL #1000
.FILL #100
.FILL #10
.FILL #1

.END