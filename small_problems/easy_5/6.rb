# PROCESS
#   - Given a string with one or more space seperated words
#   - return a hash that's key is a word length and it's value
#   is the number of words in the given string with that key's length
#   - words are any string of characters that do not include a space
#
#   inputs
#     string
#   outputs
#     hash
# EXAMPLE
#   word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
#   word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
#   word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
#   word_sizes('') == {}
#
# DATA
#   strings
#   arrays
#   hashes
#
# ALGORITHM
#   create a hash
#   given a string
#   split the string on whitespace
#   measure the length of each word
#   IF the length of the word already exists as a key in the hash
#     increment the value of that key by 1
#   IF the length of the word doesn't exist as a key in the hash
#     create a key with that length and set the value to 1
#   return the hash
require "pry"

def word_sizes(phrase)
  count = {}
  array = phrase.split(" ")

  array.map! do |word|
    word.delete "^a-zA-Z"
  end
  
  array.each do |word|
    length = word.length
    if count.key?(length)
      count[length] += 1
    else
      count[length] = 1
    end
  end
  
  count
end
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}

# (exercies 5) puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# (exercies 5) puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# (exercies 5) puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# (exercies 5) puts word_sizes('') == {}
