#Time to solve: 30min
#PROCESS
# write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words.
#
# Sentence ends are = '.' '!' '?'
# Any other character that is seperated by spaces counts as a word
#
# Print the longest sentence and the number of words.
#
#ALGO
# read in a text file and hand it to method
#
# split the text file at any sentence ends
# split each of those splits into words
# count the words in each of the sentences
# print the longest sentence after joining it together
# print the length of the sentence
#

def longest_sentence(book)
  book = open(book)
  formatted_book = book.readlines.map(&:chomp).join(' ')
  sentences = formatted_book.split(/(?<=[?!.])\s*/)
  
  sentences.map! do |sentence|
    sentence.split
  end
  
  sentences.sort_by! { |sentence| sentence.size }
  p sentences.last.join(' ')
  p sentences.last.size
end

longest_sentence("four_score.txt")
longest_sentence("frankenstein.txt")
