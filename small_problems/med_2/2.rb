#Time to solve: 24min
#PROCESS
# given a word
# using letter pairs
# return true or false depending on
# Can you spell the word without using both letters from any of the letter pairs
#
#ALGO
# given a word
# 
# create a hash with each of the keys being a two element array with both the
# letters in it and the value being false by default.
# 
# Iterate over each letter of the given word
#
# find the key where the letter is contained
# 
# if the value for that key is false
#   set it to true
# elseif the value for that key is true
#   break and return false
# end
#
require "pry"
blocks = {["B", "O"] => false, ["X", "K"] => false, ["D", "Q"] => false,
          ["C", "P"] => false, ["N", "A"] => false, ["G", "T"] => false,
          ["R", "E"] => false, ["F", "S"] => false, ["J", "W"] => false,
          ["H", "U"] => false, ["V", "I"] => false, ["L", "Y"] => false,
          ["Z", "M"] => false}

def block_word?(word, blocks)
  word.chars.each do |letter|
    match = blocks.each do |key, value_|
      break key if key.include?(letter.upcase)
    end
    
    if blocks[match] == false
      blocks[match] = true
    elsif blocks[match] == true
      break false
    end

    return true
  end
end

puts block_word?('BATCH', blocks) #== true
puts block_word?('BUTCH', blocks) #== false
puts block_word?('jest', blocks) #== true
