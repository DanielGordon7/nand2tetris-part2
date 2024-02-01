

// push constant 111
@111
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 333
@333
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 888
@888
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// pop static 8
@SP
M = M - 1
A = M
D = M

@StaticTest.8
M = D   // RAM[StaticTest.8] = *SP

// pop static 3
@SP
M = M - 1
A = M
D = M

@StaticTest.3
M = D   // RAM[StaticTest.3] = *SP

// pop static 1
@SP
M = M - 1
A = M
D = M

@StaticTest.1
M = D   // RAM[StaticTest.1] = *SP

// push static 3
@StaticTest.3
D = M
@SP
A = M
M = D   // *SP = RAM[StaticTest.3]

@SP
M = M + 1

// push static 1
@StaticTest.1
D = M
@SP
A = M
M = D   // *SP = RAM[StaticTest.1]

@SP
M = M + 1

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

// push static 8
@StaticTest.8
D = M
@SP
A = M
M = D   // *SP = RAM[StaticTest.8]

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