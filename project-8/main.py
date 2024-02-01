import os
import sys
from myparser import Parser
from translator import Translator


input = sys.argv[1]
output_file = sys.argv[2]

vm_files = None
if input.endswith(".vm"):
    ## single vm file
    vm_files = [input]
else:
    ## directory of vm files
    path = input
    vm_files = [path + "/" + file for file in os.listdir(path) if file.endswith(".vm")]
    vm_files.sort(reverse=True)

print(vm_files)

translator = Translator(output_file)

## bootstap code: SP = 256; call Sys.init
text = f"\n// bootstrap code"
text += """
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
"""
translator.write_and_count(text)
translator.write_call("bootstrap", "Sys.init", 0)

for file in vm_files:
    translator.write_and_count(f"\n\n// VM file: {file}")
    parser = Parser(file)
    cur_fn = None
    ## to keep track of which function the label is inside of; there must be a function declaration before a label
    ## also to count how many function calls occur within a function's body to enumerate the Caller$ret.i labels
    while parser.commands_left:

        vm_command = parser.next_command()
        print(vm_command)
        vm_line_num = parser.cur_line  # because Logical commands use jump statements, need to distinguish reference labels between lt/eq/gt
        command_type = parser.command_type(vm_command)
        input_file_name = file.split("/")[-1][:-3]  # needed to name static variables in push/pop


        if command_type == "ARITHMETIC":
            translator.write_arithmetic(vm_command)

        elif command_type == "LOGICAL":
            translator.write_logical(vm_command, vm_line_num)

        elif command_type == "PUSH":
            segment, num = parser.parse_push_pop(vm_command)
            translator.write_push(segment, num, input_file_name)

        elif command_type == "POP":
            segment, num = parser.parse_push_pop(vm_command)
            translator.write_pop(segment, num, input_file_name)


        elif command_type == "LABEL":
            label_symbol = parser.parse_branch(vm_command)
            translator.write_label(cur_fn, label_symbol)

        elif command_type == "GOTO":
            label_symbol = parser.parse_branch(vm_command)
            translator.write_goto(cur_fn, label_symbol)        

        elif command_type == "IF":
            label_symbol = parser.parse_branch(vm_command)
            translator.write_if(cur_fn, label_symbol)


        elif command_type == "FUNCTION":
            fn_name, n_vars = parser.parse_function(vm_command)
            cur_fn = fn_name
            translator.write_function(fn_name, int(n_vars))

        elif command_type == "CALL":
            callee, n_args = parser.parse_function(vm_command)
            translator.write_call(cur_fn, callee, int(n_args))

        elif command_type == "RETURN":
            translator.write_return()


translator.close_file()