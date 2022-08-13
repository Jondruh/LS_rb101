# Print all odd numbers from 1 to 99, inclusive, to the console,
# with each number on a separate line.

# PROCESS
#   input: none
#   output: integers

#   - Each number on a seperate line
#   - 1 and 99 included
#   - only print odd numbers

# EXAMPLES

# DATA
#   ranges and integers

# ALGORITHM
#   - Define a range 1 through 99
#   - Loop over each integer in the range
#   - If the integer is odd print it
#   - If it's even skip it.
  
# (1..99).each do |num|
#   puts num if num.odd?
# end

# odds = []
# 1.upto(99) { |num| odds << num }
# odds.reject! do |num|
#   num.even?
# end
# puts odds

# num = 1
# until num > 99
#   puts num
#   num += 2
# end

puts (1..99).reject { |element| element % 2 == 0 }

