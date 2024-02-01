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
        self.file = open(file, "w")
        self.seg_symbol_map = {"local": "LCL", "argument": "ARG", "this": "THIS", "that": "THAT"}


    def write_arithmetic(self, cmd):
        """
        add:
            SP--
            D = *SP
            SP--
            D += *SP
            SP* = D
            SP++

        neg:
            *(SP - 1) = -*(SP - 1)
        """
        
        text_to_write = f"\n\n// {cmd}\n"
        text = ""

        if cmd == "add":
            text = inspect.cleandoc(
            """
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
            """)

        elif cmd == "sub":
            text = inspect.cleandoc(
            """
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
            """)

        elif cmd == "neg":
            text = inspect.cleandoc(
            """
            @SP
            A = M - 1
            D = -M
            M = D
            """
            )

        text_to_write += text
        self.file.write(text_to_write)

    def write_logical(self, cmd, lineNum):
        """
        Note: True <=> 111111111111111111 = -1
              False <=> 00000000000000000 = -1
        lt:
            SP--
            D = *SP
            SP--
            D = D < *SP
            SP* = D
            SP++

        not:
            not *(SP - 1)
        """
        text_to_write = f"\n\n// {cmd}\n"
        text = ""

        if cmd == "eq":
            ## if (a-b)==0 return -1 (true), else return 0 (false)
            text = inspect.cleandoc(
            """
            @SP
            M = M - 1   // SP--
            A = M
            D = M   // D = *(SP-1)

            @SP
            M = M - 1   // SP--
            A = M
            D = M - D   // D = *(SP-2) - *(SP-1)
            
            @EQ.{line_n}
            D;JEQ
            @SP
            A = M
            M = 0
            @END.{line_n}
            0;JMP

            (EQ.{line_n})
            @SP
            A = M
            M = -1

            (END.{line_n})
            @SP
            M = M + 1
            """).format(line_n=lineNum)

        elif cmd == "lt":
            text = inspect.cleandoc(
            """
            @SP
            M = M - 1   // SP--
            A = M
            D = M   // D = *(SP-1)

            @SP
            M = M - 1   // SP--
            A = M
            D = M - D   // D = *(SP-2) - *(SP-1)
            
            @LT.{line_n}
            D;JLT
            @SP
            A = M
            M = 0
            @END.{line_n}
            0;JMP

            (LT.{line_n})
            @SP
            A = M
            M = -1

            (END.{line_n})
            @SP
            M = M + 1
            """).format(line_n=lineNum)

        elif cmd == "gt":
            text = inspect.cleandoc(
            """
            @SP
            M = M - 1   // SP--
            A = M
            D = M   // D = *(SP-1)

            @SP
            M = M - 1   // SP--
            A = M
            D = M - D   // D = *(SP-2) - *(SP-1)
            
            @GT.{line_n}
            D;JGT
            @SP
            A = M
            M = 0
            @END.{line_n}
            0;JMP

            (GT.{line_n})
            @SP
            A = M
            M = -1

            (END.{line_n})
            @SP
            M = M + 1
            """).format(line_n=lineNum)

        elif cmd == "and":
            text = inspect.cleandoc(
            """
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
            """)

        elif cmd == "or":
            text = inspect.cleandoc(
            """
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
            """)

        elif cmd == "not":
            text = inspect.cleandoc(
            """
            @SP
            A = M - 1
            D = !M
            M = D
            """)

        text_to_write += text
        self.file.write(text_to_write)

    def write_push(self, seg, i, inFileName):
        """
        push local/argument/this/that i
            addr = LCL/ARG/THIS/THAT + i
            *SP = *addr
            SP++

        push temp i
            addr = 5 + i
            *SP = *addr
            SP++
        
        push constant i
            *SP = i
            SP++

        push pointer 0/1
            *SP = THIS/THAT
            SP++

        push static i
            get value saved in variable input_file_name.i (there will always be a pop to that same i)
            push to stack
        """
        text_to_write = f"\n\n// push {seg} {i}\n"
        text = ""

        # if segment = local or argument or THIS or THAT
        if seg == "local" or seg == "argument" or seg == "this" or seg == "that":

            ptr_symbol = self.seg_symbol_map[seg]
            text = inspect.cleandoc(
            """
            @{i}
            D = A
            @{ptr}
            D = M + D   // RAM[{ptr}] + {i}
            @R13
            M = D   // R13 = temporary addr

            A = M
            D = M
            @SP
            A = M
            M = D   // *SP = *R13

            @SP
            M = M + 1   // SP++
            """.format(i=i, ptr=ptr_symbol))


        # if segment = temp
        elif seg == "temp":
            text = inspect.cleandoc(
            """
            @{i}
            D = A
            @5
            D = A + D   // 5 + {i}
            @R13
            M = D   // R13 = temporary addr

            A = M
            D = M
            @SP
            A = M
            M = D   // *SP = *R13

            @SP
            M = M + 1   // SP++
            """.format(i=i))

        # elif segment = constant
        elif seg == "constant":
            text = inspect.cleandoc(
            """
            @{i}
            D = A
            @SP
            A = M
            M = D

            @SP
            M = M + 1   // SP++
            """.format(i=i))

    
        # elif segment = pointer 0/1 (THIS/THAT)
        elif seg == "pointer":
            symbol = "THIS" if (i == 0) else "THAT"
            text = inspect.cleandoc(
            """
            @{symb}
            D = M

            @SP
            A = M
            M = D   // *SP = {symb}

            @SP
            M = M + 1
            """).format(symb=symbol)

        # elif segment = static
        elif seg == "static":
            text = inspect.cleandoc(
            """
            @{in_fname}.{i}
            D = M
            @SP
            A = M
            M = D   // *SP = RAM[{in_fname}.{i}]

            @SP
            M = M + 1
            """).format(i=i, in_fname=inFileName)
            

        self.file.write(text_to_write + text)

    def write_pop(self, seg, i, inFileName):
        """
        pop local/argument/this/that i
            addr = LCL/ARG/THIS/THAT + i
            SP--
            *addr = SP*

        don't pop constant

        pop pointer 0/1
            SP--
            THIS/THAT = *SP

        pop static i
            pop stack
            create variable input_file_name.i and save value
        """
        text_to_write = f"\n\n// pop {seg} {i}\n"
        text = ""

        if seg == "local" or seg == "argument" or seg == "this" or seg == "that":

            ptr_symbol = self.seg_symbol_map[seg]
            text = inspect.cleandoc(
            """
            @{i}
            D = A
            @{ptr}
            D = M + D   // RAM[{ptr}] + {i}
            @R13
            M = D   // R13 = temporary addr

            @SP
            M = M - 1   // SP--

            A = M
            D = M
            @R13
            A = M
            M = D   // *R13 = *SP
            """.format(i=i, ptr=ptr_symbol))

        elif seg == "temp":
            text = inspect.cleandoc(
            """
            @{i}
            D = A
            @5
            D = A + D   // 5 + {i}
            @R13
            M = D   // R13 = temporary addr

            @SP
            M = M - 1   // SP--

            A = M
            D = M
            @R13
            A = M
            M = D   // *R13 = *SP
            """.format(i=i))

        elif seg == "pointer":
            symbol = "THIS" if (i == 0) else "THAT"
            text = inspect.cleandoc(
            """
            @SP
            M = M - 1
            
            A = M
            D = M
            @{symb}
            M = D   // {symb} = *SP  
            """).format(symb=symbol)

        elif seg == "static":
            text = inspect.cleandoc(
            """            
            @SP
            M = M - 1
            A = M
            D = M

            @{in_fname}.{i}
            M = D   // RAM[{in_fname}.{i}] = *SP
            """).format(in_fname=inFileName, i=i)
        
        self.file.write(text_to_write + text)

    def close_file(self):
        self.file.close()
