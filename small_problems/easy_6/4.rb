#PROCESS
# Write a mutating method that takes an array and reverses the order of the elements
# in the array.

#ALGO
# given an array
# counter = 1
# reverse_counter = end_of_array index
#
# Number of swaps to do is equal to the number of elements in the array divided by 2
# ignoring the remainder
# 
# LOOP times the number of swaps to make
#   placeholder = array element at counter index
#   array[counter] = array[reverse_counter]
#   array[reverse_counter] = placeholder
#
#   counter = counter + 1
#   reverse_counter = reverse_counter - 1
#   
#   END
require "pry"

# def reverse!(array)
#   return array if array.size < 2

#   counter = 0
#   reverse_counter = -1

#   swaps = array.size / 2

#   loop do
#     placeholder = array[counter]
#     array[counter] = array[reverse_counter]
#     array[reverse_counter] = placeholder

#     counter += 1
#     reverse_counter -= 1
#     break if counter == swaps
    
#   end

#   array
# end
#
def reverse!(array)
  counter = 0
  reverse_counter = -1

  swaps = array.size / 2

  loop do
    break if counter >= swaps
    array[counter], array[reverse_counter] = array[reverse_counter], array[counter]

    counter += 1
    reverse_counter -= 1
  end

  array
end

# def reverse!(array)
#   # array.sort_by! { |ele| -array.rindex(ele) }
#   array.sort_by!.with_index { |ele, index| -index }
# end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true
