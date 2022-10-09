# PROCESS
#   -given an array of integers between 0 and 19
#   -return an array of those integers sorted based on the
#   english words for each character
#
#   inputs
#     array
#   outputs
#     sorted array
#
# EXAMPLE
# alphabetic_number_sort((0..19).to_a) == [
#  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#  6, 16, 10, 13, 3, 12, 2, 0
#]
#
# DATA
#   arrays
#   strings
#   hashes
#
# ALGORITHM
#   -create a constant variable hash with integers 0-19 as keys and the english
#   language string as the key value.
#   -create a new array
#   -call the #sort on the array using the english language strings as the
#   sort criteria for each number
#   -return the new array
#
num_words = %w[zero one two three four five six
             seven eight nine ten eleven twelve
             thirteen fourteen fifteen sixteen
             seventeen eighteen nineteen]

NUM_HASH = (0..19).each_with_object({}) do |int, hash|
  hash[int] = num_words[int]
end

def alphabetic_number_sort(array)
  array.sort do |a, b|
    NUM_HASH[a] <=> NUM_HASH[b]
  end
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
