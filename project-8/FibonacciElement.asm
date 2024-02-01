
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

// VM file: FunctionCalls/FibonacciElement/Sys.vm

// function Sys.init 0
(Sys.init)

// push constant 4
@4
D = A
@SP
A = M
M = D

@SP
M = M + 1

// call Main.fibonacci 1
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
@1
D = D + A
@SP
D = M - D
@ARG
M = D    // ARG = SP - 5 - nArgs

@SP
D = M
@LCL
M = D    // LCL = SP

@Main.fibonacci
0;JMP    // goto Main.fibonacci

(Sys.init$ret.1)

// label END
(Sys.init$END)

// goto END
@Sys.init$END
0;JMP

// VM file: FunctionCalls/FibonacciElement/Main.vm

// function Main.fibonacci 0
(Main.fibonacci)

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

// lt
@SP
M = M - 1
A = M
D = M    // D = *(SP-1)

@SP
M = M - 1
A = M
D = M - D    // D = *(SP-2) - *(SP-1)

@LT.14
D;JLT
@SP
A = M
M = 0
@END.14
0;JMP

(LT.14)
@SP
A = M
M = -1

(END.14)
@SP
M = M + 1

// if-goto N_LT_2
@SP
AM = M - 1    // save value and SP--
D = M + 1
@Main.fibonacci$N_LT_2
D;JEQ         // top of stack = True

@SP
A = M
D = M         // top of stack = Decimal
@Main.fibonacci$N_LT_2
D;JGT

// goto N_GE_2
@Main.fibonacci$N_GE_2
0;JMP

// label N_LT_2
(Main.fibonacci$N_LT_2)

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

// label N_GE_2
(Main.fibonacci$N_GE_2)

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

// call Main.fibonacci 1
@Main.fibonacci$ret.1
D = A
@SP
A = M
M = D
@SP
M = M + 1    // push asm line num of (Main.fibonacci$ret.1)

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
@1
D = D + A
@SP
D = M - D
@ARG
M = D    // ARG = SP - 5 - nArgs

@SP
D = M
@LCL
M = D    // LCL = SP

@Main.fibonacci
0;JMP    // goto Main.fibonacci

(Main.fibonacci$ret.1)

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

// call Main.fibonacci 1
@Main.fibonacci$ret.2
D = A
@SP
A = M
M = D
@SP
M = M + 1    // push asm line num of (Main.fibonacci$ret.2)

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
@1
D = D + A
@SP
D = M - D
@ARG
M = D    // ARG = SP - 5 - nArgs

@SP
D = M
@LCL
M = D    // LCL = SP

@Main.fibonacci
0;JMP    // goto Main.fibonacci

(Main.fibonacci$ret.2)

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