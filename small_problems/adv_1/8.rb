#PROCESS
#  Given an array to sort
#  Output a new array that is sorted using a merge sort
#  
# 
#EXAMPLES
#
# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]
# 
# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]
#
#DATA
#
#ALGORITHM
#  FIRST METHOD
#  Break the given array down into indivdual parts
#    find the middle length of the array by dividing by two
#    using the middle length split the array into two halves
#    continue doing this until the array has been nested so that each array
#    contains one element.
#    return the nested array
#  
#  SECOND METHOD
#  given a nested array to merge sort
#  start from the lowest nesting and merge sort each array upwards
#    if array sizes are greater than 1 call the method again
#    else merge and return 
#  Once complete return the new array

require 'benchmark'

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
    else
      new_arr << arr1[idx1]
      new_arr << arr2[idx2]
      idx1 += 1
      idx1 += 2
    end
  end
  
  new_arr.flatten
end

def split_arr(arr)
  return arr if arr.length == 1

  new_arr = []

  middle = (arr.length / 2)

  new_arr = [split_arr(arr[0..middle - 1]), split_arr(arr[middle..-1])] 
end

def merge_sort(array)
  return array if array.length == 1
  
  middle = (array.length / 2)
  
  merge(merge_sort(array[0..middle - 1]), merge_sort(array[middle..-1]))
end

array = []
1_000_000.times { |_| array << (1..100).to_a.sample } 


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

p Benchmark.measure { merge_sort(array) }
p Benchmark.measure { array.sort }