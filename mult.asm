.ORIG x3000

ADD R0, R0, #0
LD R1, ONE; plicand
LD R2, TWO; plier
ADD R3, R0, #1
NOT R4, R0; reverse

MULT1
    AND R2, R2, R4; check remain bits
    BRz STOP
    AND R5, R2, R3; 0 pass summing / 1 don't
    BRz MULT2
    ADD R0, R0, R1; add multip bits to sum

MULT2
    ADD R1, R1, R1; shift multiplicand bits for next sum
    ADD R3, R3, R3; shift checker for plier
    ADD R4, R4, R4; left shift end checker  exmp: 1111 ADD 1111 = 11110, 111100, 1111000
    BRnzp MULT1

STOP
    HALT

ONE .FILL #3
TWO .FILL #5

.END