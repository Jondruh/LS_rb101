#time to solve: 26min
#PROCESS
# make a mini stack-and-register-based programming language.
#
# I will have a stack (like an array)
# and a register (a variable)
#
# Use the program by passing in commands as strings
# Each word in the string will do something
# Each command will be seperated by a space
# Register should be initialized as 0
#
# COMMANDS
#   n (an integer) - Place value n in the register
#   PUSH - push the register value on to the stack, leave value in register
#   ADD - Pops a value from the stack and adds it to the register value
#     store the result in register
#   SUB - same as ADD but subtracting
#   MULT - Same as ADD but multiplying
#   DIV - Pops from the stack and divides that value by the register value
#     stores result in register
#   MOD - Does division and saves the remainder to the register
#   POP - Removes the topmost item from the stack and place it in register
#   PRINT - print the register value
#
#ALGORITHM
# given a string of command seperate by spaces
# split the command into an array where each element is one command
# make stack = []
# make register = 0
#
# For each command in the command array
#   Check the command
#   Carry out the operation
# END
#

def minilang(instructions)
  command_list = instructions.split

  stack = []
  register = 0

  command_list.each do |command|
    case command
      when "PUSH"
        stack.push(register)
      when "ADD"
        register += stack.pop
      when "SUB"
        register -= stack.pop
      when "MULT"
        register *= stack.pop
      when "DIV"
        register = register / stack.pop
      when "MOD"
        register = register % stack.pop
      when "POP"
        register = stack.pop
      when "PRINT"
        puts register
      else
        register = command.to_i
    end
  end
end

minilang('3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 4 PUSH 5 MULT SUB ADD DIV PRINT')
# minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

#minilang('5 PUSH POP PRINT')
# 5

#minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

#minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

#minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

#minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
