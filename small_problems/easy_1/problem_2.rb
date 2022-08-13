# Process the problem.
#   Input:
#     (1) negative, positive, or zero integer
#
#   Output:
#     (1) True if absolute value is odd
#
#  -May NOT use #odd or #even methods to determine "oddness"
#  -May assume that input is valid input.
#
#
# Examples:
#   puts is_odd?(2) #> false
#   puts is_odd?(5) #> true
#   puts is_odd?(-17) #> true
#   puts is odd?(-8) #> false
#   puts isodd?(0) #> false
#  
# Data structures
#   take an integer and work with integer eventually outputing a boolean.
#   
# Algorithm
#   Take input integer
#   find if integer can be divided by 2 evenly.
#   if it can't and isn't 0
#   return true
#
# def is_odd?(integer)
#   integer % 2 == 1
# end

def is_odd?(integer)
  integer.remainder(2) == 1 || integer.remainder(2) == -1
end

 


puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
