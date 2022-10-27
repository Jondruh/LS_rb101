# PROCESS
# write a method that takes two sorted arrays as inputs
# output a single array containing all of the elements from the two 
# given arrays but sorted.
# -May not sort the final merged array. 
# -Have to build the new array one element at a time and sort as you go.
# -Do not mutate the given arrays
#
# ALGORITHM
#   Make a new array
#   Initialize two varaibles, ele1 and ele2 and point them at
#   the first element in each of the arrays.

#   LOOP until new_array length is equal to array1 + array2 length
#    if either ele1 or ele2 is equal to nil
#      put the rest of the non-nil array in the new array and break loop
#    if ele1 is smaller than ele2
#      add ele1 to new_array
#        make ele1 point to next ele in the array
#      else if ele1 is larger than ele2
#        add ele2 to new_array
#        make ele2 point to next ele in the array
#   LOOP END
#   Return the new array

def merge(arr1, arr2) 
  new_arr = []
  idx1 = 0
  idx2 = 0
  
  until new_arr.length == (arr1.length + arr2.length)
    if arr1[idx1] == nil && arr2[idx2] == nil
      break
    elsif arr1[idx1] == nil
      new_arr << arr2[idx2..-1]
      break
    elsif arr2[idx2] == nil
      new_arr << arr1[idx1..-1]
      break
    end

    if arr1[idx1] < arr2[idx2]
      new_arr << arr1[idx1]
      idx1 += 1
    elsif arr2[idx2] < arr1[idx1]
      new_arr << arr2[idx2]
      idx2 += 1
    end
  end
  
  new_arr.flatten
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
