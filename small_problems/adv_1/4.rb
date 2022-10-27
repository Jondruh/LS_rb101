#PROCESS
#Write a method that takes at least 1 row and 1 column
# return a matrix that has it's columns and rows swapped.
#
#EXAMPLES
#
#DATA
#  arrays
#
#ALGO
# make a new array
#  array should be an outer array containing empty arrays equaling
#  the number of elements in the first given sub_array
#  
# For each sub array in the given array
#   place each element with a matching index into the new array at
#   the array with the same index


#transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
#transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
#transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
#transpose([[1]]) == [[1]]

def transpose(matrix)
  new_mat = Array.new(matrix[0].length) { |e| [] }

  matrix.each do |sub_array|
    sub_array.each.with_index do |ele, ind|
      new_mat[ind] << ele
    end
  end
  
  new_mat
end

puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]
