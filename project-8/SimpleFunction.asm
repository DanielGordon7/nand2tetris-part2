

// function SimpleFunction.test 2
(SimpleFunction.test)

// push constant 0
@0
D = A
@SP
A = M
M = D

@SP
M = M + 1

// push constant 0
@0
D = A
@SP
A = M
M = D

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

// push local 1
@1
D = A
@LCL
D = M + D    // RAM[LCL] + 1
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

// not
@SP
A = M - 1
D = !M
M = D

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

// return
@LCL
D = M
@endFrame
M = D    // endFrame = LCL
@5
A = D - A
D = M
@retAddr
M = D    // retAddr = *(endFrame - 5) -> temp variable (asm line number below jmp to callee)

@SP
A = M - 1
D = M
@ARG
A = M
M = D    // *ARG = *(SP - 1)

@ARG
D = M
@SP
M = D + 1    // SP = ARG + 1

@endFrame
A = M - 1
D = M
@THAT
M = D    // THAT = *(endFrame - 1)

@2
D = A
@endFrame
A = M - D
D = M
@THIS
M = D    // THIS = *(endFrame - 2)

@3
D = A
@endFrame
A = M - D
D = M
@ARG
M = D    // ARG = *(endFrame - 3)

@4
D = A
@endFrame
A = M - D
D = M
@LCL
M = D    // LCL = *(endFrame - 4)

@retAddr
A = M
0;JMP    // goto retAddr