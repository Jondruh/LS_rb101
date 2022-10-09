# PROCESS
#   Write method that finds all multiples of 3 or 5 that lie between 1
#   and a given number. Compute the sum of the numbers you find.
#
#   inputs:
#     a number to calculate to
#   outputs:
#     a number which is the sum of multiples found
#
# EXAMPLES
#
# DATA
#   integers
#   ranges?
#
# ALGORITHM
#   sum = 0
#   given a number
#   for every number between 1 and the given number
#     check if it's evenly divisible by 5 or 3
#       IF it is evenly divisible add it to the sum
#       IF it isn't evenly divisible move on
#   return sum
#
# CODE
def multisum(num)
  sum = 0
  (2..num).each do |number|
    if number % 5 == 0 || number % 3 == 0
      sum += number
    end
  end
  sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
