# PROCESS
#   Write a program that asks for six number from the user, then prints a
#   message that tells if the sixth number appears amongst the first 5 numbers
#
#   Inputs:
#     Six integers
#   Outputs:
#     An info string with an array of inputs interpolated
#
#   Explicit reqs:
#     Get 6 numbers from users
#     Return whether the 6th number was any of the first 5
#
#   Implicit Reqs:
#     
#
#   Questions?
#     - Does it need to print a string requesting each number? Would other input
#     methods be acceptable?
#     - 
#
# EXAMPLES
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].
#     
# DATA
#   Inputs will be strings will need to be converted to integers
#   Will store integers in an array
#   Will output a string with integers and array interpolated.
#
# ALGORITHM
#   Make an empty array
#   Get a number from user
#   Put the number in the array
#   Repeat steps 2 and 3 until there are 6 numbers in the array
#   Compare the last number in the array to each of the other number
#   Output the results to the console
#

def get_num(which_one, array)
  puts "Enter the #{which_one} number:"
  array << gets.chomp.to_i
end

array = []

get_num("1st", array)
get_num("2nd", array)
get_num("3rd", array)
get_num("4th", array)
get_num("5th", array)
get_num("last", array)

last_num = array.pop
if array.include?(last_num)
  puts "The number #{last_num} appears in #{array}"
else
  puts "The number #{last_num} does not appear in #{array}"
end

