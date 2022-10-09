#PROCESS
# input
#   two arrays
# output
#   one new array
#
# new array should be a combo of both input arrays with each element alternating
#
# -arrays will no be empty
# -arrays will have the same number of elements
# -non-mutating
# -return value is the meaningful part
# 
#
#EXAMPLES
#
#DATA
# arrays
#
#ALGORITHM
# given two arrays
# create new array that will be returned
# SET counter = 0
#
# LOOP
#   add element of array 1
#   add element of array 2
#   Increment counter
#   BREAK if the counter is equal to the size of either of the arrays
# END
#
# Return the new array
#
#
# def interleave(arr1, arr2)
#   new_array = []
#   counter = 0

#   loop do
#     new_array << arr1[counter] << arr2[counter]

#     counter += 1
#     break if counter == arr1.size
#   end
    
#   new_array
# end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end




puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
