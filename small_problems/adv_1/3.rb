#17 min to complete
#PROCESS
# write your own nested array transpose method
# Given a 3x3 nested array such as shown below
# transpose it so that a new array is returned which has each row
# "rotated" to become a column
#
# don't modify the original matrix
#
#DATA
# arrays
#
#ALGORITHM
# given a matrix
# create a new empty matrix
#
# counter = 0
#
# 
# Do an entire iteration over each sub-array three seperate tiems
#   put value at counter index in each sub array into the new matrix
#   
# increment counter
# 
# return the new matrix
#
# given an array of arrays
# pairs array []
# for each index in length of array - 1
#   for each index in this array - 1
#     index up to new array length
#       put [new_array[index], new_array[upto]] in the pairs array
#
# new
#     
def transpose(arr)
  arr.map.with_index do |_, index|
    arr.each_with_object([]) do |sub_array, obj|
      obj << sub_array[index]
    end
  end
end

def matrix_transpose_pairs(arr)
  pairs = []

  0.upto(arr.length - 2) do |spot_1|
    (spot_1 + 1).upto(arr.length - 1) do |spot_2|
      pairs << [spot_1, spot_2]
    end
  end

  pairs
end

def transpose!(arr)
  swaps = matrix_transpose_pairs(arr)

  swaps.each do |num1, num2|
    arr[num1][num2], arr[num2][num1] = arr[num2][num1], arr[num1][num2]
  end
  nil
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9, 10, 11, 12],
  [13, 14, 15, 16]
]

new_matrix = transpose(matrix)

transpose!(matrix2) 
p matrix2 == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
