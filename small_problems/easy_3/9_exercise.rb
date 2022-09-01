# PROCESS
#   Write a method that returns true or false. True if the string passed to it
#   is a palindrome. Anything else false.
#   INPUTS
#     a string
#   OUTPUTS
#     a boolean
#
#   Explicit reqs
#     - case matters
#     - punctuation matters
#     - spaces matter
#
#   Implicit reqs
#     -
#
# EXAMPLES
#   palindrome?('madam') == true
#   palindrome?('Madam') == false          # (case matters)
#   palindrome?("madam i'm adam") == false # (all characters matter)
#   palindrome?('356653') == true
#
# DATA
#   strings
#
# ALGORITHM
#   reverse the given string
#     - SET counter = 0
#     - loop until counter = length of the string - 1
#     - take the character at counter and add it to a new string at index -counter
#     - Increment counter
#   compare the reversed string to the original
#     if they match return true
#   anything else return false
#   
# CODE
# 
# def palindrome?(string)
#   string == string.reverse
# end

def palindrome?(string)
  counter = -1
  reversed_string = ''
  loop do
    reversed_string = reversed_string + string[counter]
    counter -= 1
  break if counter * -1 == string.length + 1  
  end
  string == reversed_string
end

def array_palindrome?(array)
  array == array.reverse
end

def arr_str_palindrome?(possible_palindrome)
  possible_palindrome == possible_palindrome.reverse
end

puts arr_str_palindrome?('madam') == true
puts arr_str_palindrome?('Madam') == false          # (case matters)
puts arr_str_palindrome?("madam i'm adam") == false # (all characters matter)
puts arr_str_palindrome?('356653') == true

puts arr_str_palindrome?([1, 2, 3, 2, 1]) == true
puts arr_str_palindrome?([1, 2, 3, 4]) == false
puts arr_str_palindrome?([1, 2, 'a', 2, 1]) == true
