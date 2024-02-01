

// VM file: FunctionCalls/NestedCall/Sys.vm

// function Sys.init 0
(Sys.init)

// push constant 4000
@4000
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop pointer 0
@SP
M = M - 1

A = M
D = M
@THIS
M = D    // THIS = *SP  

// push constant 5000
@5000
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop pointer 1
@SP
M = M - 1

A = M
D = M
@THAT
M = D    // THAT = *SP  

// call Sys.main 0
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

@Sys.main
0;JMP    // goto Sys.main

(Sys.init$ret.1)

// pop temp 1
@1
D = A
@5
D = A + D    // 5 + 1
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
(Sys.init$LOOP)

// goto LOOP
@Sys.init$LOOP
0;JMP

// function Sys.main 5
(Sys.main)

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

// push constant 0
@0
D = A
@SP
A = M
M = D

@SP
M = M + 1

// push constant 4001
@4001
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop pointer 0
@SP
M = M - 1

A = M
D = M
@THIS
M = D    // THIS = *SP  

// push constant 5001
@5001
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop pointer 1
@SP
M = M - 1

A = M
D = M
@THAT
M = D    // THAT = *SP  

// push constant 200
@200
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop local 1
@1
D = A
@LCL
D = M + D    // RAM[LCL] + 1
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// push constant 40
@40
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop local 2
@2
D = A
@LCL
D = M + D    // RAM[LCL] + 2
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// push constant 6
@6
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop local 3
@3
D = A
@LCL
D = M + D    // RAM[LCL] + 3
@R13
M = D    // R13 = temporary addr

@SP
M = M - 1

A = M
D = M
@R13
A = M
M = D    // *R13 = *SP

// push constant 123
@123
D = A
@SP
A = M
M = D

@SP
M = M + 1

// call Sys.add12 1
@Sys.main$ret.1
D = A
@SP
A = M
M = D
@SP
M = M + 1    // push asm line num of (Sys.main$ret.1)

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

@Sys.add12
0;JMP    // goto Sys.add12

(Sys.main$ret.1)

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

// push local 2
@2
D = A
@LCL
D = M + D    // RAM[LCL] + 2
@R13
M = D    // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D    // *SP = *R13

@SP
M = M + 1

// push local 3
@3
D = A
@LCL
D = M + D    // RAM[LCL] + 3
@R13
M = D    // R13 = temporary addr

A = M
D = M
@SP
A = M
M = D    // *SP = *R13

@SP
M = M + 1

// push local 4
@4
D = A
@LCL
D = M + D    // RAM[LCL] + 4
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

// function Sys.add12 0
(Sys.add12)

// push constant 4002
@4002
D = A
@SP
A = M
M = D

@SP
M = M + 1

// pop pointer 0
@SP
M = M - 1

A = M
D = M
@THIS
M = D    // THIS = *SP  

// push constant 5002
@5002
D = A
@SP
A = M
M = D

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

// push constant 12
@12
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