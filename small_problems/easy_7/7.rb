# PROCESS
#   Take an array of integers, multiply them together, then divide the result by
#   the number of entries in the arrya. print the result rounded to 3 decimal
#   places. The array will not be empty
#
#EXAMPELS
#
#DATA
# integers
# arrays
# floats
#
#ALGORITHM
# given an array of integers
# multiply them all together
# divide the result by the number of elements in the array
# round and print that result to 3 decimal places.

def show_multiplicative_average(array)
  p (array.reduce(:*).to_f / array.length).round(3)
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
