#Time to solve 16min
#PROCESS
# write a method that will bubble sort an array.
# Mutate that array!
# Bubble sort works by comparing pairs in a collection and swapping them
# if the left is greater than the right.
# The sort will iterate over each element and the next element
# The sort will continue making passes over the whole array until it
# reaches the end without making a swap.
#
#DATA
# arrays
# integer
# strings
#
#ALGO
# given an array
# Loop through the following until no swaps are made in an entire iteration
#   swaps = false
#   Iterate over each index of the array except the last
#   if index is greater than index + 1
#     swap places
#     move to next iteration
#
#   if swaps = true then break the loop the sort is done.
# return a new array
#

def bubble_sort!(arr)
  loop do
    swaps = false
    
    (arr.size - 1).times do |ind|
      
      if arr[ind] > arr[ind + 1]
        arr[ind], arr[ind + 1] = arr[ind + 1], arr[ind]
        swaps = true
      end
    end
    
    break if swaps == false
  end
  nil
end

array = [5, 3]
p bubble_sort!(array)

p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
