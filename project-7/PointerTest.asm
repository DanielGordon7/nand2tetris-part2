

// push constant 3030
@3030
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop pointer 0
@SP
M = M - 1

A = M
D = M
@THIS
M = D   // THIS = *SP  

// push constant 3040
@3040
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop pointer 1
@SP
M = M - 1

A = M
D = M
@THAT
M = D   // THAT = *SP  

// push constant 32
@32
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop this 2
@2
D = A
@THIS
D = M + D   // RAM[THIS] + 2
@R13
M = D   // R13 = temporary addr

@SP
M = M - 1   // SP--

A = M
D = M
@R13
A = M
M = D   // *R13 = *SP

// push constant 46
@46
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop that 6
@6
D = A
@THAT
D = M + D   // RAM[THAT] + 6
@R13
M = D   // R13 = temporary addr

@SP
M = M - 1   // SP--

A = M
D = M
@R13
A = M
M = D   // *R13 = *SP

// push pointer 0
@THIS
D = M

@SP
A = M
M = D   // *SP = THIS

@SP
M = M + 1

// push pointer 1
@THAT
D = M

@SP
A = M
M = D   // *SP = THAT

@SP
M = M + 1

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

// push this 2
@2
D = A
@THIS
D = M + D   // RAM[THIS] + 2
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

// push that 6
@6
D = A
@THAT
D = M + D   // RAM[THAT] + 6
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