#Time to solve: 16min
#PROCESS
# Write a method that takes an integer as an argument.
# Return the difference between
#   -the square of the sum of the first(given integer)  positive integers
#   -the sum of the squares of the first(given integer) positive integers
#   
#DATA
# integer
#
#ALGO
# given a number
# 
# sum_square = 0
# square_sum = 0
#
# sum from 1 to the given number and then square the result
#   save that result to sum_square
#
# fomr 1 to the given number
#   square each
#   add that to square_sum
#
# return sum_square - square_sum (absolute)
#

def sum_square_difference(int)

  sum_square = (1..int).inject(:+) ** 2

  square_sum = (1..int).inject do |memo, num|
    (num ** 2) + memo
  end

  sum_square - square_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
