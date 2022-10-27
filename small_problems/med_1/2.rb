# time to complete: 20min
#
#PROCESS
# write a method that roates the last n digits of number
#
#ALGORITHM
# given an integer and a rotation number
# starting from the leftmost two digits, rotate them and then move right
# one place and rotate those two
#   slice off the amount of integer that needs to be rotated
#     integer to string
#     the given (-rotation number to the end of the string)
#   turn that slice into an array
#   for each in the array
#     current index and next index swap places
#     break if next index == nil
#   join the array and add it to the unrotated string
#   return the string converted to intege

def rotate_array(array)
  array[1..-1] << array.first
end

def rotate_rightmost_digits(digits, rotation)
  rotated_num = digits.to_s.chars
  to_rotate = rotated_num[-rotation..-1]

  (to_rotate.size - 1).times do |index|
    to_rotate[index], to_rotate[index + 1] = to_rotate[index + 1], to_rotate[index]
  end
  
  (rotated_num[0..-rotation - 1] + to_rotate).join.to_i
end

def rotate_rightmost_digits(digits, rotation)
  digits_arr = digits.to_s.chars
  rotated = digits_arr[0..-(rotation + 1)] << \
            rotate_array(digits_arr[-rotation..-1])
  rotated.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
