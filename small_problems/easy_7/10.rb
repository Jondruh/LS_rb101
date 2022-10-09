def penultimate(words)
  words.split[-2]
end

# puts penultimate('last word') == 'last'
# puts penultimate('Launch School is great!') == 'is'

def middle_word(words)
  list = words.split
  return nil if list.length < 1
  return list[0] if list.length <= 2
  
  middle_word = list.length / 2
  
  if list.length.even?
    list[middle_word - 1]
  else
    list[middle_word]
  end
  
end

puts middle_word("apple") == 'apple'
puts middle_word("") == nil
puts middle_word(" ") == nil
puts middle_word("apple spice") == 'apple'
puts middle_word("apple spice pie") == 'spice'
puts middle_word("apple pie is a yummy treat") == 'is'

#PROCESS
# given a string of words return the middle word
# should return the single word if 1 word
# should return the middle word closest to the start if even number of words
# should return the first word if 2 words
# words are any grouping of characters seperated by a space
#
#EXAMPLES
# middle_word("apple") == 'apple'
# middle_word("") == nil
# middle_word(" ") == nil
# middle_word("apple spice") == 'apple'
# middle_word("apple spice pie") == 'spice'
# middle_word("apple pie is a very yummy treat") == 'is'
#
#DATA
# strings
# arrays
#
#ALGORITHM
# given a string
# split the string into individual words
# IF the amount of words is 1, return the one word
# IF the amount of words is < 1, return nil
# IF the amount of words is > 1
#   return the word at the array index equal to amount of words / 2
#


 

