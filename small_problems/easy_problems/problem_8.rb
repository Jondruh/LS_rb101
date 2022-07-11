# PROCESS THE PROBLEM
#   Inputs
#     array containing integers
#   Outputs
#     integer that is the average of all the numbers in array
#
#   The array will never be empty
#   The numbers in the array will always be positive
#   The result should be an integer (not a float, so rounding
#     will not be perfectly accurate.)
#
# EXAMPLES
#   
# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40
#
# DATA
#   Input will be array, we will take each of the integers contained
#   in the array and return an integer.
#
# ALGORITHM
#   Given an array
#
#   Take each element of the array and sum them
#   Divide the sum by the number of elements in the array
#
# CODE!

def average(array)
  sum = 0
  
  array.each { |ele| sum += ele }
  
  (sum.to_f / array.size).round(2)
end

puts average([1, 6])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
