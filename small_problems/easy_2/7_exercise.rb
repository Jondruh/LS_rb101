# Print all even numbers from 1 to 99, inclusive, to the console, with each number
# on a seperate line.
#
# Process:
#   inputs: none
#   outputs: each even number in given range
#
#   -Print all even numbers from 1 to 99
#   -Each number on a seperate line.
#
# Examples:
#   2
#   4
#   6
#   .... etc
#
# Data
#   Ranges, integers
#
# Algorithm
#   - create counter variable and set it to 1
#   - start loop
#   - check if the counter is greater than 99, break the loop if it is.
#   - check if the counter is odd or even and print it if it's even
#   - add 1 to the counter
#   - end

# counter = 1
# loop do
#   break if counter > 99
#   puts counter if counter % 2 == 0
#   counter += 1
# end

# array = (1..99).to_a
# array.reject! { |num| num % 2 == 1 }
# puts array

value = 2
while value <= 99
  puts value
  value += 2
end

