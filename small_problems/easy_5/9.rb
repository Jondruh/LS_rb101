# PROCESS
#   Given a line of text, make a box around it.
#
#   inputs
#     a string
#   outputs
#     a printed version of the string with a border around it
#
#   The input will fit inside your terminal.
#
# EXAMPLES
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
#
#print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
#
# DATA
#   strings
#
# ALGORITHM
#   given a string
#   measure the length of the string and add 2
#   print the top of the banner with a '+' added to either side
#   print an empty line with '|' added directly below the '+'
#   print the string padded on each side with a space and bracketed by '|'
#   repeat the first two lines in reverse order
#
def print_in_box(string)
  padding = string.length + 2
  puts "+#{'-' * padding}+"
  puts "|#{' ' * padding}|"
  puts "| #{string} |"
  puts "|#{' ' * padding}|"
  puts "+#{'-' * padding}+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
