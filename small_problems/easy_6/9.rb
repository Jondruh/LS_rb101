#PROCESS
# Write a method that takes an array and a value to search for as arguments. Return
# true if the value is in the array, false if not.
#
# May not use #include? in the solution
#
#DATA
# arrays
#
#ALGORITHM
# given an array and search_val
#
# counter = 0
# LOOP
#   IF the element at array index of the counter equals search_val
#     return true
#     
#   counter = counter + 1
#   
#   IF counter >= array size
#     BREAK
# LOOP END
# 
# false

# def include?(array, search_val)
#   return false if array.empty?
  
#   counter = 0

#   loop do
#     return true if array[counter] == search_val

#     counter += 1

#     break if counter >= array.size
#   end
#   false
# end

# def include?(array, search_val)
#   array.each { |ele| return true if search_val == ele }
#   false
# end

def include?(array, search_val)
  !!array.find_index(search_val)
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
