#PROCESS
# Write a method that takes a single array and splits it into two arrays down the middle
#
# If there are an odd number of elements in the array, the middle odd element should
# be put with the first half array.
#
def halvsies(array)
  first_half, second_half = array.partition.with_index do |ele, index|
    if array.size.even?
      index < (array.size) / 2
    else
      index <= array.size / 2
    end
  end
  [first_half, second_half]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
