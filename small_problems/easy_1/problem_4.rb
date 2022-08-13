# Process the Problem
#   Count the number of occurrences of each element in a given array
#     words are case-sensitive
#   Need to count and store for each unique word and print the count for each word
#
#   Inputs
#     1. Array of words
#   Outputs
#     1. Unique words and their counts
#
# EXAMPLES/TEST CASES
#   input: vehicles = [ 'car', 'car', 'truck']
#   
#   output:
#   car => 2
#   truck => 1
#
# DATA STRUCTURE
#   Save each unique element of array to hash that holds the count as well as the
#   element.
#
# ALGORITHM
#   Given array
#
#   iterate over each element in array
#     if element is new
#       add element as hash key and set value to 1
#     if element is already in hash
#       increment matching hash value by 1
#
#   for each key/value pair in the hash
#     print hash key => hash value
#
# CODE!

# def count_occurrences(array)
#   the_count = {}
  
#   array.each do |element|
#     if the_count.include?(element.to_sym)
#       the_count[element.to_sym] += 1
#     elsif
#       the_count[element.to_sym] = 1
#     end
#   end
  
#   the_count.each_pair { |car, count| puts "#{car} => #{count}" }
# end

def count_occurrences(array)
  the_count = {}
  array.each { |element| element.downcase! }
  
  array.uniq.each do |element|
    the_count[element] = array.count(element)
  end
  
  the_count.each_pair { |car, count| puts "#{car} => #{count}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'suv', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
