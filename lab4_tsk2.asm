.ORIG x3000

WARN_STR
    LEA R0, STG
    PUTS
    LEA R1, IO

LOOP_IO
    GETC
    OUT
    ADD R2, R0, #-10
    BRz PRINT
    STR R0, R1, #0
    ADD R1, R1, #1
    BRnzp LOOP_IO

PRINT
    LEA R0, IO
    PUTS

HALT

STG .STRINGZ "Please, input your string with max size of 100 characters: "
IO .BLKW #100

.END
