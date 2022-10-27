# Time to solve 29min
#PROCESS
# maximum rotate a given integer
#   that means rotating the front digit to the back, then "lock" the first
#   digit and rotate the next digit to the back and so on until you rotate the
#   last two digits.
#
#   The first rotation is just the normal rotation,
#   the next are rotations of a smaller and smaller slice
#
#ALGORITHM
# given an integer
# rotate the rightmost digit with rotation set to the size of the array
# next rotate the rightmost digit with rotation set to negative -1 the size
# of the array
require "pry"

def rotate_array(array)
  array[1..-1] << array.first
end

def rotate_rightmost_digits(digits, rotation)
  digits[0..-(rotation + 1)] + [rotate_array(digits[-rotation..-1])]
end

def max_rotation(integer)
  numbers = integer.to_s.chars
  numbers.size.downto(2) do |num|
    numbers = rotate_rightmost_digits(numbers, num).flatten
  end
  
  numbers.join.to_i
end


puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
