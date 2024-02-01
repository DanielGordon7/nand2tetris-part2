

// push constant 0
@0
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop local 0
@0
D = A
@LCL
D = M + D    // RAM[LCL] + 0
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

// push local 0
@0
D = A
@LCL
D = M + D    // RAM[LCL] + 0
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

// pop local 0
@0
D = A
@LCL
D = M + D    // RAM[LCL] + 0
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

// if-goto LOOP
@SP
AM = M - 1
D = M    // logical expression
@LOOP
D;JGT

// push local 0
@0
D = A
@LCL
D = M + D    // RAM[LCL] + 0
@R13
M = D    // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D    // *SP = *R13

@SP
M = M + 1