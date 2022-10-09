#PROCESS
# Write a method that takes two arrays and returns a new array that contains
# the product of each element with the same index of the two array arguments.
#
# -both arrays given will have the same length
#
#EXAMPLES
#multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
#
#DATA
# integers
# arrays
#
#ALGORITHM
# given two arrays
# create a new array
# SET counter = 0
#
# LOOP
#   new_array[counter] = array1[counter] * array2[counter]
#   counter += 1
#   BREAK IF counter = array1 length
# END
#
# RETURN new array

# def multiply_list(arr1, arr2)
#   arr1.each_with_object([]).with_index do |(num, new_array), index|
#     new_array << num * arr2[index] 
#   end
# end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |pairs| pairs[0] * pairs[1] }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
