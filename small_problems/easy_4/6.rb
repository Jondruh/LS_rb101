# PROCESS
#   Write a method that will take an array of numbers and return an array with
#   the same number of elements. Each new element should be the running total
#   of summing each element in the array.
#
#   inputs:
#     array of integers
#   outputs:
#     modified array of integers
#
#   should this method mutate the argument or return a new array?
#   
# EXAMPLE
#
# DATA
#   Arrays
#   Integers
#
# ALGORITHM
#   Given an array of integers
#
#   Replace each element in the array with the sum of that element and
#   each of the elements proceeding it.
#     MAKE running_total = 0
#     MAKE index = 0
#
#     WHILE index < total elements in array
#       running_total += element array[index] 
#       SET array[index] to running total
#       increment index by 1
#       
#   return the new array
#
# CODE
# def running_total(array)
#   running_total = 0
#   index = 0

#   while index < array.length
#     running_total += array[index]
#     array[index] = running_total
#     index += 1
#   end

#   array
# end

# def running_total(array)
#   sum = 0
#   array.map { |num| sum += num }
# end

def running_total(array)
  new_array = []
  new_array << array.inject do |running_total, num|
    new_array << running_total
    running_total + num
  end
  if new_array == [nil]
    new_array.clear
  end
  new_array
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) ==  []
