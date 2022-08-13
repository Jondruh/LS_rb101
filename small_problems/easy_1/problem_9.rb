# PROCESS
#   inputs: a positive integer
#   outputs: sum of all digits
#
#   Explicit:
#     Sum the digits of the given argument.
#
#   Implicit:
#     Ignore non-integer parts of the argument
#
# EXAMPLES
#   puts sum(23) == 5
#   puts sum(496) == 19
#   puts sum(123_456_789) == 45
#     
# DATA
#   integers
#   
# ALGORITHM
#   Take argument
#   create sum
#   add the digit in each number place to sum
#   return sum
#
# CODE

def sum(int)
  int.to_i.digits.sum
end

puts sum("23aj")
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

