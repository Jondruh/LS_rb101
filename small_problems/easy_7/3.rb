#PROCESS
# input
#   a string
# output
#   a new string
#
# Take a single string and return a new string that is that string with the first letter
# of each word uppercase and all other lower case
def word_cap(string)
  words = string.downcase.split
  words.map! do |word|
    word.capitalize
  end
  words.join(" ")
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

