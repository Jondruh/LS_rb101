# PROCESS
#   inputs
#     string of words seperated by spaces
#   outputs
#     modified string
#
#   return a string with the first and last letter of every word has been swapped
#
#   every word has at least one letter, a string will always have a word.
#
#   Each string only has words and spaces
#
# EXAMPLES

# DATA
#   strings
#   arrays
#
# ALGORITHM
#   given a string
#   split the string on white space into an array
#   for each of the items in the array
#     take the first letter of a word and save it
#     take the last letter of word and save it
#     replace the last letter with the saved first letter
#     replace the first letter with the saved last letter
#   join the array back to a string and return it


def swap(string)
  swapped_words = string.split.map do |word|
    first_letter, last_letter = word[0], word[-1]
    word[0] = last_letter
    word[-1] = first_letter
    word
  end
  swapped_words.join(' ')
end
puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
