

// push constant 17
@17
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 17
@17
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// eq
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D   // D = *(SP-2) - *(SP-1)

@EQ.10
D;JEQ
@SP
A = M
M = 0
@END.10
0;JMP

(EQ.10)
@SP
A = M
M = -1

(END.10)
@SP
M = M + 1

// push constant 17
@17
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 16
@16
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// eq
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D   // D = *(SP-2) - *(SP-1)

@EQ.13
D;JEQ
@SP
A = M
M = 0
@END.13
0;JMP

(EQ.13)
@SP
A = M
M = -1

(END.13)
@SP
M = M + 1

// push constant 16
@16
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 17
@17
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// eq
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D   // D = *(SP-2) - *(SP-1)

@EQ.16
D;JEQ
@SP
A = M
M = 0
@END.16
0;JMP

(EQ.16)
@SP
A = M
M = -1

(END.16)
@SP
M = M + 1

// push constant 892
@892
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 891
@891
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// lt
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D   // D = *(SP-2) - *(SP-1)

@LT.19
D;JLT
@SP
A = M
M = 0
@END.19
0;JMP

(LT.19)
@SP
A = M
M = -1

(END.19)
@SP
M = M + 1

// push constant 891
@891
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 892
@892
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// lt
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D   // D = *(SP-2) - *(SP-1)

@LT.22
D;JLT
@SP
A = M
M = 0
@END.22
0;JMP

(LT.22)
@SP
A = M
M = -1

(END.22)
@SP
M = M + 1

// push constant 891
@891
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 891
@891
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// lt
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D   // D = *(SP-2) - *(SP-1)

@LT.25
D;JLT
@SP
A = M
M = 0
@END.25
0;JMP

(LT.25)
@SP
A = M
M = -1

(END.25)
@SP
M = M + 1

// push constant 32767
@32767
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 32766
@32766
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// gt
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D   // D = *(SP-2) - *(SP-1)

@GT.28
D;JGT
@SP
A = M
M = 0
@END.28
0;JMP

(GT.28)
@SP
A = M
M = -1

(END.28)
@SP
M = M + 1

// push constant 32766
@32766
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 32767
@32767
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// gt
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D   // D = *(SP-2) - *(SP-1)

@GT.31
D;JGT
@SP
A = M
M = 0
@END.31
0;JMP

(GT.31)
@SP
A = M
M = -1

(END.31)
@SP
M = M + 1

// push constant 32766
@32766
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 32766
@32766
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// gt
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M - D   // D = *(SP-2) - *(SP-1)

@GT.34
D;JGT
@SP
A = M
M = 0
@END.34
0;JMP

(GT.34)
@SP
A = M
M = -1

(END.34)
@SP
M = M + 1

// push constant 57
@57
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 31
@31
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// push constant 53
@53
D = A
@SP
A = M
M = D

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

// push constant 112
@112
D = A
@SP
A = M
M = D

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

// neg
@SP
A = M - 1
D = -M
M = D

// and
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M & D
M = D   // *SP = *(SP-2) AND *(SP-1)

@SP
M = M + 1   // SP++

// push constant 82
@82
D = A
@SP
A = M
M = D

@SP
M = M + 1   // SP++

// or
@SP
M = M - 1   // SP--
A = M
D = M   // D = *(SP-1)

@SP
M = M - 1   // SP--
A = M
D = M | D
M = D   // *SP = *(SP-2) OR *(SP-1)

@SP
M = M + 1   // SP++

// not
@SP
A = M - 1
D = !M
M = D