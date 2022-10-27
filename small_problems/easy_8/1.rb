#PROCESS
# Write a method that takes an array of number and returns a sum
# The sum should be the sum of the sums of each leading subsequence for
# that Array.
#
#EXAMPLES
#sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35
#
#DATA
# arrays
# integers
#
#ALGORITHM
# Given an array of numbers
# SET sum = 0
# SET counter = 0
# LOOP
#   set the sum equal to the sum plus the range of elements from
#   0 to the counter.
#   SET counter = counter + 1
#   BREAK if counter = array size
# END
#
# RETURN sum
# def sum_of_sums(array)
#   total = 0
#   counter = 0

#   loop do
#     total += array[0..counter].sum
#     counter += 1
#     break if counter == array.size
#   end
  
#   total
# end

# def sum_of_sums(array)
#   total = 0

#   array.each.with_index do |num, index|
#     total += array[0..index].sum
#   end
  
#   total
# end
# 
def sum_of_sums(array)
  array.inject do |memo, num|
    memo + array[0..array.index(num)].sum
  end
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35


