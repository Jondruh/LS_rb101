# PROCESS
#   Write a palindrome checking method that returns a boolean.
#   EXPLICIT REQS
#     case-insensitive
#     ignores non-alphanumeric characters
#   IMPLICIT REQS
#
# EXAMPLES
# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
# real_palindrome?('123ab321') == false
#
# DATA
#   strings
#
# ALGORITHM
#   take a string
#   convert it to downcase
#   remove all non-alphanumeric characters
#   compare the converted string to the converted string reversed
#
# CODE

def real_palindrome?(string)
  test_string = string.downcase
  test_string = test_string.delete("^a-z0-9")
  test_string == test_string.reverse
end

puts real_palindrome?('madam') #== true
puts real_palindrome?('Madam') #== true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") #== true # (only alphanumerics matter)
puts real_palindrome?('356653') #== true
puts real_palindrome?('356a653') #== true
puts real_palindrome?('123ab321') #== false
