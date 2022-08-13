# Build a program that randomly generates and prints Teddy's
# age. To get the age, you should generate a random number between 20 and 200.
#
# PROCESS
#   input: nothing
#   output: print a string containing a randomly generated integer
#
#   Explicit:
#     should select a number between 20 and 200
#
# EXAMPLES
#  => Teddy is 69 years old! 
#   
# DATA
#   Will generate a random integer and interpolate into string
#
# ALGORITHM
#   randomly select from range and interpolate into string

puts "Hello, enter your name to hear your age!"
name = gets.chomp

if name == ""
  puts "Teddy is #{rand(20..200)} years old!"
else
  puts "#{name} is #{rand(20..200)} years old!"
end
