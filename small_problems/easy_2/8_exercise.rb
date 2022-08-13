# Write a program that asks the user to enter an integer greater than 0, then asks
# if the user wants to determine the sum or product of all numbers between 1 and
# the entered integer.
#
# PROCESS
#   inputs: integer, sum?/product?
#   outputs: integer
#
# - Ask for integer greater than 0
# - Determine sum OR product of all numbers between 1 and entered integer
# -
#
# EXAMPLES
#  >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# DATA
#   input will be string, will convert to integer to do math and
#   interpolates integer into string return
#
# ALGORITHM
#   - Save the given integer
#   - Make a variable to calculate the final output = 0
#   - Make a counter = 1
#   - If sum is chosen
#       loop until counter is greater than the given number
#       add counter to final output
#       increment counter by 1
#   - If product is chosen
#       loop until counter is greater than the given number
#       multiply counter by final output
#       increment counter by 1
#   - Write message to console with the final output

# puts "Please enter an integer greater than 0:"
# integer = gets.chomp.to_i

# puts "Enter 's' to compute the sum, 'p' to computer the product"
# sum_or_product = gets.chomp

# counter = 1

# case sum_or_product
# when 's'
#   output = 0
#   loop do
#     output = counter + output
#     break if counter == integer
#     counter += 1
#   end
#   puts "The sum of the integers between 1 and #{integer} is #{output}"
# when 'p'
#   output = 1
#   loop do
#     output = counter * output
#     break if counter == integer
#     counter += 1
#   end
#   puts "The product  of the integers between 1 and #{integer} is #{output}"
# end

def get_integer
  loop do
    puts "Please enter an integer greater than 0"
    integer = gets.chomp.to_i

    return integer if integer > 0
    puts "Not a valid input"
  end
end

def get_sum_or_product
  loop do
    puts "Enter 's' to compute the sum, 'p' to computer the product"
    input = gets.chomp.downcase

    return input if input.match?(/[st]/)
    puts "Not a valid input"
  end
end

integer = get_integer
sum_or_product = get_sum_or_product


case sum_or_product
when 's'
  output = (1..integer).inject { |memo, int| memo + int }
  puts "The sum of the integers between 1 and #{integer} is #{output}"
when 'p'
  output = (1..integer).inject(:*)
  puts "The product  of the integers between 1 and #{integer} is #{output}"
end
























