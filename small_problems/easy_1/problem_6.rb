# Process the problem
#   Inputs:
#     string
#   Outputs:
#     rearranged string
#       rules of rearrangement:
#         an word with 5 or more character should be reversed
#         all others should be left
#         include spaces for only more than one word
# Examples
#   below!
# Data
#   input as string, convert to array, output as string
# Algorithm
#   Take a string, index each word into an array
#   check word length
#    for words >= 5
#     reverse words
#   Join the array into a string placing a space between each word
#   
# Code!

def reverse_words(string)
  array = string.split
  
  array.each do |word|
    word.reverse! if word.length >= 5
  end
  
  array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
