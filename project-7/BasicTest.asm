

// push constant 10
@10
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop local 0
@0
D = A
@LCL
D = M + D   // RAM[LCL] + 0
@R13
M = D   // R13 = temporary addr

@SP
M = M - 1   // SP--

A = M
D = M
@R13
A = M
M = D   // *R13 = *SP

// push constant 21
@21
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 22
@22
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop argument 2
@2
D = A
@ARG
D = M + D   // RAM[ARG] + 2
@R13
M = D   // R13 = temporary addr

@SP
M = M - 1   // SP--

A = M
D = M
@R13
A = M
M = D   // *R13 = *SP

// pop argument 1
@1
D = A
@ARG
D = M + D   // RAM[ARG] + 1
@R13
M = D   // R13 = temporary addr

@SP
M = M - 1   // SP--

A = M
D = M
@R13
A = M
M = D   // *R13 = *SP

// push constant 36
@36
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop this 6
@6
D = A
@THIS
D = M + D   // RAM[THIS] + 6
@R13
M = D   // R13 = temporary addr

@SP
M = M - 1   // SP--

A = M
D = M
@R13
A = M
M = D   // *R13 = *SP

// push constant 42
@42
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 45
@45
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop that 5
@5
D = A
@THAT
D = M + D   // RAM[THAT] + 5
@R13
M = D   // R13 = temporary addr

@SP
M = M - 1   // SP--

A = M
D = M
@R13
A = M
M = D   // *R13 = *SP

// pop that 2
@2
D = A
@THAT
D = M + D   // RAM[THAT] + 2
@R13
M = D   // R13 = temporary addr

@SP
M = M - 1   // SP--

A = M
D = M
@R13
A = M
M = D   // *R13 = *SP

// push constant 510
@510
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop temp 6
@6
D = A
@5
D = A + D   // 5 + 6
@R13
M = D   // R13 = temporary addr

@SP
M = M - 1   // SP--

A = M
D = M
@R13
A = M
M = D   // *R13 = *SP

// push local 0
@0
D = A
@LCL
D = M + D   // RAM[LCL] + 0
@R13
M = D   // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D   // *SP = *R13

@SP
M = M + 1   // SP++

// push that 5
@5
D = A
@THAT
D = M + D   // RAM[THAT] + 5
@R13
M = D   // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D   // *SP = *R13

@SP
M = M + 1   // SP++

// add
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M + D
M = D   // *SP = *(SP-2) + *(SP-1)

@SP
M = M + 1   // SP++

// push argument 1
@1
D = A
@ARG
D = M + D   // RAM[ARG] + 1
@R13
M = D   // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D   // *SP = *R13

@SP
M = M + 1   // SP++

// sub
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D
M = D   // *SP = *(SP-2) - *(SP-1)

@SP
M = M + 1   // SP++

// push this 6
@6
D = A
@THIS
D = M + D   // RAM[THIS] + 6
@R13
M = D   // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D   // *SP = *R13

@SP
M = M + 1   // SP++

// push this 6
@6
D = A
@THIS
D = M + D   // RAM[THIS] + 6
@R13
M = D   // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D   // *SP = *R13

@SP
M = M + 1   // SP++

// add
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M + D
M = D   // *SP = *(SP-2) + *(SP-1)

@SP
M = M + 1   // SP++

// sub
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D
M = D   // *SP = *(SP-2) - *(SP-1)

@SP
M = M + 1   // SP++

// push temp 6
@6
D = A
@5
D = A + D   // 5 + 6
@R13
M = D   // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D   // *SP = *R13

@SP
M = M + 1   // SP++

// add
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M + D
M = D   // *SP = *(SP-2) + *(SP-1)

@SP
M = M + 1   // SP++