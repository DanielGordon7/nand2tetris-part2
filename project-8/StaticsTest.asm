
// bootstrap code
@256
D = A
@SP
M = D    // SP = 256

@0
D = A
@LCL
M = D    // LCL = -1

@0
D = A
@ARG
M = D    // ARG = -2

@0
D = A
@THIS
M = D    // THIS = -3

@0
D = A
@THAT
M = D    // THAT = -4  


// call Sys.init 0
@bootstrap$ret.1
D = A
@SP
A = M
M = D
@SP
M = M + 1    // push asm line num of (bootstrap$ret.1)

@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push LCL

@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push ARG

@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THIS

@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THAT

@5
D = A
@0
D = D + A
@SP
D = M - D
@ARG
M = D    // ARG = SP - 5 - nArgs

@SP
D = M
@LCL
M = D    // LCL = SP

@Sys.init
0;JMP    // goto Sys.init

(bootstrap$ret.1)

// VM file: FunctionCalls/StaticsTest/Sys.vm

// function Sys.init 0
(Sys.init)

// push constant 6
@6
D = A
@SP
A = M
M = D

@SP
M = M + 1

// push constant 8
@8
D = A
@SP
A = M
M = D

@SP
M = M + 1

// call Class1.set 2
@Sys.init$ret.1
D = A
@SP
A = M
M = D
@SP
M = M + 1    // push asm line num of (Sys.init$ret.1)

@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push LCL

@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push ARG

@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THIS

@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THAT

@5
D = A
@2
D = D + A
@SP
D = M - D
@ARG
M = D    // ARG = SP - 5 - nArgs

@SP
D = M
@LCL
M = D    // LCL = SP

@Class1.set
0;JMP    // goto Class1.set

(Sys.init$ret.1)

// pop temp 0
@0
D = A
@5
D = A + D    // 5 + 0
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// push constant 23
@23
D = A
@SP
A = M
M = D

@SP
M = M + 1

// push constant 15
@15
D = A
@SP
A = M
M = D

@SP
M = M + 1

// call Class2.set 2
@Sys.init$ret.2
D = A
@SP
A = M
M = D
@SP
M = M + 1    // push asm line num of (Sys.init$ret.2)

@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push LCL

@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push ARG

@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THIS

@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THAT

@5
D = A
@2
D = D + A
@SP
D = M - D
@ARG
M = D    // ARG = SP - 5 - nArgs

@SP
D = M
@LCL
M = D    // LCL = SP

@Class2.set
0;JMP    // goto Class2.set

(Sys.init$ret.2)

// pop temp 0
@0
D = A
@5
D = A + D    // 5 + 0
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// call Class1.get 0
@Sys.init$ret.3
D = A
@SP
A = M
M = D
@SP
M = M + 1    // push asm line num of (Sys.init$ret.3)

@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push LCL

@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push ARG

@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THIS

@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THAT

@5
D = A
@0
D = D + A
@SP
D = M - D
@ARG
M = D    // ARG = SP - 5 - nArgs

@SP
D = M
@LCL
M = D    // LCL = SP

@Class1.get
0;JMP    // goto Class1.get

(Sys.init$ret.3)

// call Class2.get 0
@Sys.init$ret.4
D = A
@SP
A = M
M = D
@SP
M = M + 1    // push asm line num of (Sys.init$ret.4)

@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push LCL

@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push ARG

@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THIS

@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1    // push THAT

@5
D = A
@0
D = D + A
@SP
D = M - D
@ARG
M = D    // ARG = SP - 5 - nArgs

@SP
D = M
@LCL
M = D    // LCL = SP

@Class2.get
0;JMP    // goto Class2.get

(Sys.init$ret.4)

// label END
(Sys.init$END)

// goto END
@Sys.init$END
0;JMP

// VM file: FunctionCalls/StaticsTest/Class2.vm

// function Class2.set 0
(Class2.set)

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

// pop static 0
@SP
M = M - 1
A = M
D = M

@Class2.0
M = D    // RAM[Class2.0] = *SP

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

// pop static 1
@SP
M = M - 1
A = M
D = M

@Class2.1
M = D    // RAM[Class2.1] = *SP

// push constant 0
@0
D = A
@SP
A = M
M = D

@SP
M = M + 1

// return
@LCL
D = M
@R13
M = D    // R13 = endFrame = LCL
@5
A = D - A
D = M
@R14
M = D    // R14 = retAddr = *(endFrame - 5) -> temp variable (asm line number below jmp to callee)

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

@R13
A = M - 1
D = M
@THAT
M = D    // THAT = *(endFrame - 1)

@2
D = A
@R13
A = M - D
D = M
@THIS
M = D    // THIS = *(endFrame - 2)

@3
D = A
@R13
A = M - D
D = M
@ARG
M = D    // ARG = *(endFrame - 3)

@4
D = A
@R13
A = M - D
D = M
@LCL
M = D    // LCL = *(endFrame - 4)

@R14
A = M
0;JMP    // goto retAddr

// function Class2.get 0
(Class2.get)

// push static 0
@Class2.0
D = M
@SP
A = M
M = D    // *SP = RAM[Class2.0]

@SP
M = M + 1

// push static 1
@Class2.1
D = M
@SP
A = M
M = D    // *SP = RAM[Class2.1]

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
@R13
M = D    // R13 = endFrame = LCL
@5
A = D - A
D = M
@R14
M = D    // R14 = retAddr = *(endFrame - 5) -> temp variable (asm line number below jmp to callee)

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

@R13
A = M - 1
D = M
@THAT
M = D    // THAT = *(endFrame - 1)

@2
D = A
@R13
A = M - D
D = M
@THIS
M = D    // THIS = *(endFrame - 2)

@3
D = A
@R13
A = M - D
D = M
@ARG
M = D    // ARG = *(endFrame - 3)

@4
D = A
@R13
A = M - D
D = M
@LCL
M = D    // LCL = *(endFrame - 4)

@R14
A = M
0;JMP    // goto retAddr

// VM file: FunctionCalls/StaticsTest/Class1.vm

// function Class1.set 0
(Class1.set)

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

// pop static 0
@SP
M = M - 1
A = M
D = M

@Class1.0
M = D    // RAM[Class1.0] = *SP

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

// pop static 1
@SP
M = M - 1
A = M
D = M

@Class1.1
M = D    // RAM[Class1.1] = *SP

// push constant 0
@0
D = A
@SP
A = M
M = D

@SP
M = M + 1

// return
@LCL
D = M
@R13
M = D    // R13 = endFrame = LCL
@5
A = D - A
D = M
@R14
M = D    // R14 = retAddr = *(endFrame - 5) -> temp variable (asm line number below jmp to callee)

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

@R13
A = M - 1
D = M
@THAT
M = D    // THAT = *(endFrame - 1)

@2
D = A
@R13
A = M - D
D = M
@THIS
M = D    // THIS = *(endFrame - 2)

@3
D = A
@R13
A = M - D
D = M
@ARG
M = D    // ARG = *(endFrame - 3)

@4
D = A
@R13
A = M - D
D = M
@LCL
M = D    // LCL = *(endFrame - 4)

@R14
A = M
0;JMP    // goto retAddr

// function Class1.get 0
(Class1.get)

// push static 0
@Class1.0
D = M
@SP
A = M
M = D    // *SP = RAM[Class1.0]

@SP
M = M + 1

// push static 1
@Class1.1
D = M
@SP
A = M
M = D    // *SP = RAM[Class1.1]

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
@R13
M = D    // R13 = endFrame = LCL
@5
A = D - A
D = M
@R14
M = D    // R14 = retAddr = *(endFrame - 5) -> temp variable (asm line number below jmp to callee)

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

@R13
A = M - 1
D = M
@THAT
M = D    // THAT = *(endFrame - 1)

@2
D = A
@R13
A = M - D
D = M
@THIS
M = D    // THIS = *(endFrame - 2)

@3
D = A
@R13
A = M - D
D = M
@ARG
M = D    // ARG = *(endFrame - 3)

@4
D = A
@R13
A = M - D
D = M
@LCL
M = D    // LCL = *(endFrame - 4)

@R14
A = M
0;JMP    // goto retAddr