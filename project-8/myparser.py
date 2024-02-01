"""
Arithmetic commands:
    - sum
    - sub
    - neg

Logic commands:
    - eq
    - lt
    - gt
    - and
    - or
    - not

Memory segment commands:
    - push segment i
    - pop segment i
"""

# constructor inputs .vm file to read

# attribute commands_left: bool -> to iterate in main.py until commands_left=False


class Parser:
    def __init__(self, file):
        self.content = open(file, "r").readlines()  # list of each line (str ending in '\n')
        self.commands_left = True
        self.n_lines = len(self.content)
        self.cur_line = 0

    def next_command(self) -> str:
        for line_num in range(self.cur_line, self.n_lines):
            line = self.content[line_num]
            self.cur_line += 1
            if line == '\n' or line.startswith("//"):
                ## ignore comments and empty lines
                continue
            else:
                return line.split("//")[0].strip()
            
        self.commands_left = False
        return ""
            
    def command_type(self, command: str) -> str:
        if command in ["add", "sub", "neg"]:
            return "ARITHMETIC"
        
        elif command in ["eq", "lt", "gt", "and", "or", "not"]:
            return "LOGICAL"

        elif command.startswith("push"):
            return "PUSH"
        
        elif command.startswith("pop"):
            return "POP"
        
        elif command.startswith("label"):
            return "LABEL"
        
        elif command.startswith("goto"):
            return "GOTO"
        
        elif command.startswith("if-goto"):
            return "IF"
        
        elif command.startswith("function"):
            return "FUNCTION"
        
        elif command.startswith("call"):
            return "CALL"
        
        elif command.startswith("return"):
            return "RETURN"

    def parse_push_pop(self, command: str) -> tuple[str, int]:
        _, segment, i = command.split(" ")
        return segment, int(i)
    
    def parse_branch(self, command: str) -> tuple[str, str]:
        _, lbl_symb = command.split(" ")
        print(lbl_symb)
        return lbl_symb
    
    def parse_function(self, command: str) -> tuple[str, str]:
        _, fName, n = command.split(" ")
        return fName, n
    