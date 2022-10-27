# PROCESS
#    rotating matrices
#     given a arbitrary matrix, rotate it 90 degrees clockwise
     
#    to do this, the bottom row of the matrix becomes the leftmost
#    column.
#    
#    the middle row becomes the middle column, the top row becomes
#    the rightmost column.
 
# EXAMPLES

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# becomes:

# 3  4  1
# 9  7  5
# 6  2  8

# -------
# 3  4  1
# 9  7  5

# becomes:
# 9  3
# 7  4
# 5  1

# ALGORITHM
   # given an arbitrary matrix
   #  make a new matrix array
   #  for the length of each sub-array in the matrix,  starting from the last
   #    take the first index element of each sub array and add
   #    it to the first row and so on incrementing through the elements


def rotate90(matrix)
  rotated_matrix = Array.new(matrix[0].length).map { |_| [] }

  0.upto(matrix[0].length - 1) do |ind|
    arr = []
    matrix.reverse_each do |sub_arr|
      arr << sub_arr[ind]
    end
    rotated_matrix[ind] = arr
  end

  rotated_matrix
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2    
