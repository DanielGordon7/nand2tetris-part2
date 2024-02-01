

// push argument 1
@1
D = A
@ARG
D = M + D    // RAM[ARG] + 1
@R13
M = D    // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D    // *SP = *R13

@SP
M = M + 1

// pop pointer 1
@SP
M = M - 1

A = M
D = M
@THAT
M = D    // THAT = *SP  

// push constant 0
@0
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop that 0
@0
D = A
@THAT
D = M + D    // RAM[THAT] + 0
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// push constant 1
@1
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop that 1
@1
D = A
@THAT
D = M + D    // RAM[THAT] + 1
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// push argument 0
@0
D = A
@ARG
D = M + D    // RAM[ARG] + 0
@R13
M = D    // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D    // *SP = *R13

@SP
M = M + 1

// push constant 2
@2
D = A
@SP
A = M
M = D

@SP
M = M + 1

// sub
@SP
M = M - 1
A = M
D = M    // D = *(SP-1)

@SP
M = M - 1
A = M
D = M - D
M = D    // *SP = *(SP-2) - *(SP-1)

@SP
M = M + 1

// pop argument 0
@0
D = A
@ARG
D = M + D    // RAM[ARG] + 0
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// label LOOP


(LOOP)

// push argument 0
@0
D = A
@ARG
D = M + D    // RAM[ARG] + 0
@R13
M = D    // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D    // *SP = *R13

@SP
M = M + 1

// if-goto COMPUTE_ELEMENT
@SP
AM = M - 1    // save value and SP--
D = M    // logical expression
@COMPUTE_ELEMENT
D;JGT

// goto END
@END
0;JMP

// label COMPUTE_ELEMENT


(COMPUTE_ELEMENT)

// push that 0
@0
D = A
@THAT
D = M + D    // RAM[THAT] + 0
@R13
M = D    // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D    // *SP = *R13

@SP
M = M + 1

// push that 1
@1
D = A
@THAT
D = M + D    // RAM[THAT] + 1
@R13
M = D    // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D    // *SP = *R13

@SP
M = M + 1

// add
@SP
M = M - 1
A = M
D = M    // D = *(SP-1)

@SP
M = M - 1 
A = M
D = M + D
M = D    // *SP = *(SP-2) + *(SP-1)

@SP
M = M + 1

// pop that 2
@2
D = A
@THAT
D = M + D    // RAM[THAT] + 2
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// push pointer 1
@THAT
D = M

@SP
A = M
M = D    // *SP = THAT

@SP
M = M + 1

// push constant 1
@1
D = A
@SP
A = M
M = D

@SP
M = M + 1

// add
@SP
M = M - 1
A = M
D = M    // D = *(SP-1)

@SP
M = M - 1 
A = M
D = M + D
M = D    // *SP = *(SP-2) + *(SP-1)

@SP
M = M + 1

// pop pointer 1
@SP
M = M - 1

A = M
D = M
@THAT
M = D    // THAT = *SP  

// push argument 0
@0
D = A
@ARG
D = M + D    // RAM[ARG] + 0
@R13
M = D    // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D    // *SP = *R13

@SP
M = M + 1

// push constant 1
@1
D = A
@SP
A = M
M = D

@SP
M = M + 1

// sub
@SP
M = M - 1
A = M
D = M    // D = *(SP-1)

@SP
M = M - 1
A = M
D = M - D
M = D    // *SP = *(SP-2) - *(SP-1)

@SP
M = M + 1

// pop argument 0
@0
D = A
@ARG
D = M + D    // RAM[ARG] + 0
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// goto LOOP
@LOOP
0;JMP

// label END


(END)