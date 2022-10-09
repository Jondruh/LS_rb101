#PROCESS
# input
#   array of strings
# outputs
#   and array of the same string values, except with the vowels removed
#
# Mutating or no?
#EXAMPLES
#
#DATA
# arrays
# strings
#
#ALGORITHM
# Iterate over each element in the array
# save any elements that aren't a vowel to a new array
# return the new array
#
# DESTRUCTIVE METHOD
# Iterate over each element in the array
# delete any elements that aren't consonants
#
def remove_vowels(array)
  array.map do |string|
    string.gsub(/[aeiouAEIOU]/, '')
  end
end

def remove_vowels!(array)
  array.each do |string|
    string.gsub!(/[aeiouAEIOU]/, '')
  end
end

array1 = %w(abcdefghijklmnopqrstuvwxyz)
array2 = %w(ABC AEIOU XYZ)
array3 = %w(green YELLOW black white)

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

puts remove_vowels!(array1) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels!(array3) == %w(grn YLLW blck wht)
puts remove_vowels!(array2) == ['BC', '', 'XYZ']

p array1
p array2
p array3


