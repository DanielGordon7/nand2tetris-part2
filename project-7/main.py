import sys
from myparser import Parser
from translator import Translator

# input_file = "./StackArithmetic/SimpleAdd/SimpleAdd.vm"
# output_file = "./StackArithmetic/SimpleAdd/SimpleAdd.asm"
# input_file = "./StackArithmetic/StackTest/StackTest.vm"
# output_file = "./StackArithmetic/StackTest/StackTest.asm"
# input_file = "./MemoryAccess/BasicTest/BasicTest.vm"
# output_file = "./MemoryAccess/BasicTest/BasicTest.asm"
# input_file = "./MemoryAccess/PointerTest/PointerTest.vm"
# output_file = "./MemoryAccess/PointerTest/PointerTest.asm"
# input_file = "./MemoryAccess/StaticTest/StaticTest.vm"
# output_file = "./MemoryAccess/StaticTest/StaticTest.asm"

input_file = sys.argv[1]
output_file = sys.argv[2]

parser = Parser(input_file)

translator = Translator(output_file)


while parser.commands_left:

    vm_command = parser.next_command()
    line_num  =parser.cur_line  # because Logical commands use 'if statement' JMP, need to distinguish reference labels in asm
    command_type = parser.command_type(vm_command)


    if command_type == "ARITHMETIC":
        translator.write_arithmetic(vm_command)

    elif command_type == "LOGICAL":
        translator.write_logical(vm_command, line_num)

    elif command_type == "PUSH":
        segment, num = parser.parse_push_pop(vm_command)
        input_file_name = input_file.split("/")[-1][:-3]
        translator.write_push(segment, num, input_file_name)

    elif command_type == "POP":
        segment, num = parser.parse_push_pop(vm_command)
        input_file_name = input_file.split("/")[-1][:-3]
        translator.write_pop(segment, num, input_file_name)


translator.close_file()