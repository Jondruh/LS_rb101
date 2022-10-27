#time to solve: 27min
#PROCESS
# Write a method that takes a string sentence and returns the same string with
# any sequence of written out numbers converted to a string of digits
#   Does it matter if they are consecutive? Or just that those strings exist?
#   I will program as if it's just that a "zero" string exists.
# is this a mutating method? i think it is
#
#ALGORITHM
#
# Given a string
# 
# Create a hash for the numbers where the key is the english for the digit
# and the key is a string digit: "zero" => "0"
# 
# split the string into an array of words
# transform each element of the array
#   if the element exists in the hash as a key, replace it with the value
#   if not, don't change the element.
# 
#
#
# word_to_digit('Please call me at five five five one two three four. Thanks.')
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

DIGITS = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
          'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}
          
def word_to_digit(string)
  string.gsub(/[\W]/, ' ').split.each do |word|
    string.gsub!(word, DIGITS[word]) if DIGITS.key?(word) 
  end
  string
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.')

