# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# PROCESS
#   input: Length, Width
#   output: square meters, square feet

#   Explicit:
#     Don't worry about validating input.
#     Display in square meters and square feet.

#   Implicit:

# EXAMPLES
#   Enter the length of the room in meters:
#   10
#   Enter the width of the room in meters:
#   7
#   The area of the room is 70.0 square meters (753.47 square feet).

# DATA
#   We will work with receive strings, convert to integers and output
#   interpolated integers with a string.

# ALGORITHM
#   assign each argument to a variable
#   convert the arguments to integers
#   multiply the two arguments and assign the result to a square meters variable
#   multiply the result by 10.7639 and assign that to a square feet variable
#   display a string that interpolates both the square meters and square feet results

SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCH = 144
SQFEET_TO_SQCENT = 929.03

puts "Enter the length of the room in feet:"
length = gets.chomp.to_f

puts "Enter the width of the room in feet:"
width = gets.chomp.to_f

square_feet = (length * width).round(2)
square_inch = (square_feet * SQFEET_TO_SQINCH).round(2)
square_cent = (square_feet * SQFEET_TO_SQCENT).round(2)

puts <<RESULT
The area of the room is: #{square_feet} square feet
                         #{square_inch} square inches
                         #{square_cent} square centimeters
RESULT

# puts "Enter the length of the room in meters:"
# length = gets.chomp.to_i

# puts "Enter the width of the room in meters:"
# width = gets.chomp.to_i

# square_meters = width * length
# square_feet = (10.7639 * square_meters).round(2)

# puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."

