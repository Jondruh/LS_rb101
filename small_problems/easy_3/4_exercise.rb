# PROCESS THE PROBLEM
# input:
#   - string of a word or multiple words
# output:
#   - string with the number of characters in the original
#     plus the original string that was counted.
#
# Implicit Reqs:
#   - Don't count spaces as characters
#
# EXAMPLES
# "walk, don't run" = 13 characters
#
# DATA
#   - string to integer to string
#
# ALGORITHM
#  - Given an input string
#  - Create a character counter
#  - Iterate over each character in the string
#  - If the character is a not a "space" add 1 to the character counter
#  - Return the final counter amount.

puts "Please write a word or multiple words:"
string = gets.chomp

puts "There are #{string.count('^ ')} characters in '#{string}'."
