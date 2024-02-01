import inspect

"""
RAM
===============
0: SP
1: LCL
2: ARG
3: THIS
4: THAT
5-12: temp
13-15: R13-R15
16-255: static
255-2047: stack

8 segments:
    - local
    - argument
    - THIS
    - THAT
    - constant
    - temp
    - static
    - pointer
"""


# constructor inputs .asm file to write to

# write assembly comment before translating each VM command

# for static segment, we use a Hack-specific implementation,
# using the fact new variables are stored in registers 16,17,... (assume won't need more than unitl 255)

class Translator:
    def __init__(self, file):
        self.outfile = open(file, "w")
        self.debugfile = open(file[:-4] + "_DEBUG.asm", "w")
        self.seg_symbol_map = {"local": "LCL", "argument": "ARG", "this": "THIS", "that": "THAT"}
        self.call_counter = 0
        self.line_num = 0

    def write_arithmetic(self, cmd):
        # self.outfile.write(f"\n\n// {cmd}\n")
        text = f"\n\n// {cmd}\n"

        if cmd == "add" or cmd == "sub":
            operator = "+" if cmd == "add" else "-"
            text += inspect.cleandoc(
            """
            @SP
            M = M - 1
            A = M
            D = M    // D = *(SP-1)

            @SP
            M = M - 1 
            A = M
            D = M {op} D
            M = D    // *SP = *(SP-2) {op} *(SP-1)

            @SP
            M = M + 1
            """).format(op=operator)

        elif cmd == "neg":
            text += inspect.cleandoc(
            """
            @SP
            A = M - 1
            D = -M
            M = D
            """)

        self.write_and_count(text)

    def write_logical(self, cmd, vmlineNum):
        text = f"\n\n// {cmd}\n"

        ## if (a-b) </=/> 0 return -1 (true), else return 0 (false)
        if cmd == "lt" or cmd == "eq" or cmd == "gt":
            lbl_symb, jmp_symb = None, None
            if cmd == "lt":
                lbl_symb, jmp_symb = "LT", "JLT"
            elif cmd == "eq":
                lbl_symb, jmp_symb = "EQ", "JEQ"
            elif cmd == "gt":
                lbl_symb, jmp_symb = "GT", "JGT"

            text += inspect.cleandoc(
            """
            @SP
            M = M - 1
            A = M
            D = M    // D = *(SP-1)

            @SP
            M = M - 1
            A = M
            D = M - D    // D = *(SP-2) - *(SP-1)
            
            @{lbl}.{vm_line_n}
            D;{jmp}
            @SP
            A = M
            M = 0
            @END.{vm_line_n}
            0;JMP

            ({lbl}.{vm_line_n})
            @SP
            A = M
            M = -1

            (END.{vm_line_n})
            @SP
            M = M + 1
            """).format(vm_line_n=vmlineNum, lbl=lbl_symb, jmp=jmp_symb)

        elif cmd == "and" or cmd == "or":
            operator = "&" if cmd == "and" else "|"
            text += inspect.cleandoc(
            """
            @SP
            M = M - 1
            A = M
            D = M    // D = *(SP-1)

            @SP
            M = M - 1
            A = M
            D = M {op} D
            M = D    // *SP = *(SP-2) {op} *(SP-1)

            @SP
            M = M + 1
            """).format(op=operator)

        elif cmd == "not":
            text += inspect.cleandoc(
            """
            @SP
            A = M - 1
            D = !M
            M = D
            """)

        self.write_and_count(text)

    def write_push(self, seg: str, i: int, inFileName: str = ""):
        text = f"\n\n// push {seg} {i}\n"

        if seg == "local" or seg == "argument" or seg == "this" or seg == "that":
            ptr_symbol = self.seg_symbol_map[seg]
            text += inspect.cleandoc(
            """
            @{i}
            D = A
            @{ptr}
            D = M + D    // RAM[{ptr}] + {i}
            @R13
            M = D    // R13 = temporary addr

            A = M
            D = M
            @SP
            A = M
            M = D    // *SP = *R13

            @SP
            M = M + 1
            """.format(i=i, ptr=ptr_symbol))

        elif seg == "temp":
            text += inspect.cleandoc(
            """
            @{i}
            D = A
            @5
            D = A + D    // 5 + {i}
            @R13
            M = D    // R13 = temporary addr

            A = M
            D = M
            @SP
            A = M
            M = D    // *SP = *R13

            @SP
            M = M + 1
            """.format(i=i))

        elif seg == "constant":
            text += inspect.cleandoc(
            """
            @{i}
            D = A
            @SP
            A = M
            M = D

            @SP
            M = M + 1
            """.format(i=i))

        elif seg == "pointer":
            symbol = "THIS" if (i == 0) else "THAT"
            text += inspect.cleandoc(
            """
            @{symb}
            D = M

            @SP
            A = M
            M = D    // *SP = {symb}

            @SP
            M = M + 1
            """).format(symb=symbol)

        elif seg == "static":
            text += inspect.cleandoc(
            """
            @{in_fname}.{i}
            D = M
            @SP
            A = M
            M = D    // *SP = RAM[{in_fname}.{i}]

            @SP
            M = M + 1
            """).format(i=i, in_fname=inFileName)
            
        self.write_and_count(text)

    def write_pop(self, seg, i, inFileName):
        text = f"\n\n// pop {seg} {i}\n"

        if seg == "local" or seg == "argument" or seg == "this" or seg == "that":
            ptr_symbol = self.seg_symbol_map[seg]
            text += inspect.cleandoc(
            """
            @{i}
            D = A
            @{ptr}
            D = M + D    // RAM[{ptr}] + {i}
            @R13
            M = D    // R13 = temporary addr

            @SP
            M = M - 1

            A = M
            D = M
            @R13
            A = M
            M = D    // *R13 = *SP
            """.format(i=i, ptr=ptr_symbol))

        elif seg == "temp":
            text += inspect.cleandoc(
            """
            @{i}
            D = A
            @5
            D = A + D    // 5 + {i}
            @R13
            M = D    // R13 = temporary addr

            @SP
            M = M - 1

            A = M
            D = M
            @R13
            A = M
            M = D    // *R13 = *SP
            """.format(i=i))

        elif seg == "pointer":
            symbol = "THIS" if (i == 0) else "THAT"
            text += inspect.cleandoc(
            """
            @SP
            M = M - 1
            
            A = M
            D = M
            @{symb}
            M = D    // {symb} = *SP  
            """).format(symb=symbol)

        elif seg == "static":
            text += inspect.cleandoc(
            """            
            @SP
            M = M - 1
            A = M
            D = M

            @{in_fname}.{i}
            M = D    // RAM[{in_fname}.{i}] = *SP
            """).format(in_fname=inFileName, i=i)

        self.write_and_count(text)

    def write_label(self, fnName: str, lbl_symb: str):
        text = f"\n\n// label {lbl_symb}\n" + f"({fnName}${lbl_symb})"
        self.write_and_count(text)

    def write_goto(self, fnName: str, lbl_symb: str):
        text = f"\n\n// goto {lbl_symb}\n"
        text += inspect.cleandoc(
        """            
        @{fn}${lbl}
        0;JMP
        """).format(fn=fnName, lbl=lbl_symb)
        self.write_and_count(text)

    def write_if(self, fnName: str, lbl_symb: str):
        ## if top of stack is int, do *(SP-1);JGT
        ## elif top of stack is boolean, do *(SP-1)+1;JEQ
        text = f"\n\n// if-goto {lbl_symb}\n"
        text += inspect.cleandoc(
        """
        @SP
        AM = M - 1    // save value and SP--
        D = M + 1
        @{fn}${lbl}
        D;JEQ         // top of stack = True

        @SP
        A = M
        D = M         // top of stack = Decimal
        @{fn}${lbl}
        D;JGT
        """).format(fn=fnName, lbl=lbl_symb)
        self.write_and_count(text)

    def write_function(self, fnName: str, nVars: int):
        text = f"\n\n// function {fnName} {nVars}\n" + f"({fnName})"
        self.write_and_count(text)
        for _ in range(nVars):
            self.write_push("constant", 0)
        self.call_counter = 0

    def write_call(self, caller: str, callee: str, nArgs: int):
        text = f"\n\n// call {callee} {nArgs}\n"
        self.call_counter += 1  # used to mark return label within caller's code
        text += inspect.cleandoc(
        """
        @{retAddrLabel}
        D = A
        @SP
        A = M
        M = D
        @SP
        M = M + 1    // push asm line num of ({retAddrLabel})

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
        @{num_Args}
        D = D + A
        @SP
        D = M - D
        @ARG
        M = D    // ARG = SP - 5 - nArgs

        @SP
        D = M
        @LCL
        M = D    // LCL = SP

        @{fn}
        0;JMP    // goto {fn}

        ({retAddrLabel})
        """
        ).format(retAddrLabel=f"{caller}$ret.{self.call_counter}", fn=callee, num_Args=nArgs)
        self.write_and_count(text)

    def write_return(self):
        text = f"\n\n// return\n"
        text += inspect.cleandoc(
        """
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
        """)
        self.write_and_count(text)

    def write_and_count(self, text: str, debug: bool = False):
        self.outfile.write(text)
        lines = text.split("\n")  # list
        line_numbers = []
        for line in lines:
            line_numbers.append(self.line_num)

            if line.strip().startswith("//") or line == "" or line.strip().startswith("("):
                ## comment or empty or label
                continue
            else:
                self.line_num += 1

        if debug:
            debugtext = [f"{line_numbers[i]}   " + line + "\n" for i,line in enumerate(lines)]
            self.debugfile.write("".join(debugtext))

    def close_file(self):
        self.outfile.close()
        self.debugfile.close()
