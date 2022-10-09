# PROCESS
#   take an integer and convert it to a string without using any of the provided
#   Ruby methods for doing such. Should take a positive number or zero.
#
#   inputs:
#     integer
#   outputs:
#     string
#
# EXAMPLE
#
# DATA
#   integers
#   strings
#   arrays?
#
# ALGORITHM
#   define a constant of 0-9 that holds the string value for each integer key
#   Create an empty string
#   iterate over each number place of the integer and put the string.
#     - start looping
#       - divide by 10 save the result
#       - inspect the remainder and convert it to string
#       - push the converted string to the empty string
#       - break loop if the result is equal to 0 
#     - return the string
# CODE
require "pry"
DIGITS = {
 1=>"1",
 2=>"2",
 3=>"3",
 4=>"4",
 5=>"5",
 6=>"6",
 7=>"7",
 8=>"8",
 9=>"9",
 0=>"0",
}

def integer_to_string(int)
  string = ""
  
  loop do
    int, remainder = int.divmod(10)
    string.insert(0, DIGITS[remainder])
    break if int == 0
  end

  
  string
end

def signed_integer_to_string(int)
  if int.positive?
    '+' + integer_to_string(int)
  elsif int.negative?
    '-' + integer_to_string(-int)
  else
    integer_to_string(int)
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
