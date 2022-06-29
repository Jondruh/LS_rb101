# Process the Problem
#   Understand the problem
#     input and outputs
#       input:
#         a string
#         a positive integer
#       output:
#         a number of strings


#     - There are no rules about a maximum number of prints.

#     Mental model: print a given string the number of times as the integer given.

# Examples/Test Case
#   1.
#     input:
#       "hi"
#       4

#     ouput:
#       "hi"
#       "hi"
#       "hi"
#       "hi"

#   2.
#     input:
#       "yo"
#       0

#     output:
#       blank

#   3.
#     input:
#       "wow"
#       1000

#     output:
#       "wow" * 1000

# Data structure
#   none needed. String to printing the string multiple times.
  
# Algorithm
#   1. Take integer and multiply the print command by it.

# Code!

def repeat_yourself(integer, string)
  integer.times { puts string }
end

repeat_yourself(4, "hi")

repeat_yourself(0, "yo")


