# Time to solve: 5:45min
# 
#PROCESS
# rotate an array by moving the first element to the end of the array.
# original should not be modified
# do not use #rotate or #rotate!
#
#ALGORITHM
# given an array
# move the first element to the end
#   select a slice of array that excludes the first element
#   add the first element to the end
# return the new array

def rotate_array(array)
  array[1..-1] << array.first
end

def rotate_string(string)
  string[1..-1] << string[0]
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

puts rotate_integer(123) == 231
puts rotate_string("hello") == "elloh"
puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true
