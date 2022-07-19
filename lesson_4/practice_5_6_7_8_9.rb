flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Problem 5

# p flintstones.index { |name| name.to_s.start_with?("Be") }

# Problem 6

# flintstones.map! { |name| name[0,3] }
# p flintstones

# Problem 7

# statement = "The Flintsones Rock"

# letter_count = {}
# # array = statement.chars

# # array.each do |char|
# #   letter_count[char] = array.count(char)
# # end

# statement.each_char do |letter|
#   letter_count[letter] = statement.count(letter)
# end

# p letter_count

words = "the flintstones rock"

# def my_titleize(string)
#   array = string.split
#   array.each do |word|
#     word.capitalize!
#   end
#   array.join(" ")
# end

# def my_titleize_2(string)
#   counter = 0

#   loop do
#     break if counter == string.size

#     string[0] = string[0].upcase

#     if string[counter - 1] == " "
#       string[counter] = string[counter].upcase
#     end

#     counter += 1
#   end
# end

# my_titleize_2(words)

# puts words

title = words.split.map { |word| word.capitalize }.join(" ")

puts title
