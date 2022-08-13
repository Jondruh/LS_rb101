# PROCESS
#   Write a method that takes an array as an argument and returns a new array
#   containing only the odd members of the array. (first, third, fifth, and so
#   on)
#
#   inputs:
#     array
#
#   outputs:
#     array
#
# Examples
#
# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []
#
# DATA
#   arrays
#
# ALGORITHM
#   given an array
#   save the first and every even indexed member of the array to a new array
#     -Ruby's #even? method returns true when called on integer 0
#   return the array

# def oddities(array)
#   odds_array = []
#   array.each_index { |index| odds_array << array[index] if index.even? }
#   odds_array
# end

def oddities(array)
  array.select do |ele|
    array.index(ele).even?
  end
end

def eventies(array)
  new_array = []
  counter = 1
  while counter < array.size
    new_array << array[counter]
    counter += 2
  end
  new_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts eventies([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
