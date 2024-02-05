.ORIG x3000

;R1 - array
;R2 - checkers, mult res
;R3 - constants
;R4 - number storage
;R5 - counter
;R6 - 

HI_STR
    LEA R0, HS
    PUTS
    LEA R1, ARR; array
    LEA R4, NMB; number storage

INPT
    GETC
    OUT
    
    AND R2, R2, #0
    ADD R2, R0, #-10; \n check
    BRz SORT
    

    LD R3, SB; load -32, spc bar check
    AND R2, R2, #0
    ADD R2, R0, R3
    BRz SPACE
    
    
    ADD R5, R5, #1; counter  
    STR R0, R4, #0; filling number storg 
    ADD R4, R4, #1

    BRnzp INPT

SPACE
    LEA R4, NMB; num str first pos
    LDR R0, R4, #5; load digit
    AND R4, R4, #-1; move bckwrds
    BRnzp MULT


    STR R0, R1, #0
    ADD R1, R1, #1
    BRnzp INPT

MULT
    LD R3, THSND
    AND R2, R2, #0



SORT
    LEA R1, ARR
    PUTS

HALT

HS .STRINGZ "Pls, input 10 numbers sequentially separated by a 'spc' bar: "

ARR .BLKW #30
NMB .BLKW #6

SB .FILL #-32

DEC .FILL  #10
HNDR .FILL  #100
THSND .FILL  #1000

.END