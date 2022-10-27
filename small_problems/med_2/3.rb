#time to complete: 18min
#PROCESS
# Write a method that takes a string and returns a hash
# The hash should have three key-value pairs
# the keys should be uppercase, lowercase, neither
# the values should be the corresponding percentage amount of their keys in the string
#
# Assume that the string will be at least one character
# empty space char count as neither
# 
#ALGO
# given a string
# create a hash to contain the values
# for each character in the string
#   if char is upcase
#     add 1 to uppercase
#   if char is downcase
#     add 1 to downcase
#   else
#     add 1 to neither
#
# Next check the size of the string
#  update the character counts to be percentages of the string size
#  divide the count by (size * 0.01)
#
def letter_percentages(string)
  hash = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  
  string.chars.each do |letter|
    if ('a'..'z').include?(letter)
      hash[:lowercase] += 1
    elsif ('A'..'Z').include?(letter)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end

  hash.each do |key, value|
    hash[key] = (value / (string.size * 0.01)).round(1)
  end
  
end
puts letter_percentages('abcdefGHI')
puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
