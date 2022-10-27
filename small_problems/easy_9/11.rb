#PROCESS
# given an array of words
# print out each grouping of anagrams 
#
#ALGORITHM
# METHOD
#   anagram_checker
#     check if there are anagrams in an array
#     
#     
# until the array is empty, iterate from the first word
# 
#   check if any of the other words in the array are an anagram
#     check current iteration word against each other word.
#   if they match add them to an array
#   remove them from future searches
#   print that array

def anagram_printer(words)
  until words == []
    current_word = words[0]
    
    array = words.select do |each_word|
      current_word.chars.sort == each_word.chars.sort
    end
    
    p array
    words = words - array
  end
end

 
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagram_printer(words)
puts words == ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
