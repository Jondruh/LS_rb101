# EXAMPLE 1.
# [[1, 2], [3, 4]].each do |arr|
#   puts arr.first
# end
# # 1
# # 3
# # => [[1, 2], [3, 4]]

# Line 1: #each is being called on an array containing two arrays. We open the block
# of code being passed to the #each method and assign the method variable to "arr".

# Line 2: This is the block being passed to #each. The #puts method is called on
# "arr.first". "arr.first" is the method variable we defined on line 1 with #first
# being called one it. Here, #each's "arr" variable is pointing to each of the nested
# arrays. So the on the first loop of #each: arr = [1, 2]. #first takes the first
# element of an array and returns it. So in the first pass of #each, #puts writes
# "1" to the console, which we see on line 4 of the example.

# The #each block will run again but this time, arr = [3, 4], the second of the nested
# arrays. So on the second pass of #each, #puts will write "3" to the console. Which we
# see on line 5 of the example.

# Line 3: the "end" is closing the block of the #each method.

# Line 4: output of the #puts method

# Line 5: output of the #puts method

# Line 6: The return of the the #each method. #each returns the object that called it.





# EXAMPLE 3.

# [[1, 2], [3, 4]].map do |arr|
#   puts arr.first
#   arr.first
# end

# Line 1:
#   Action - method call (map)
#   Object - The outer array
#   Side Effect - None
#   Return Value - New array [1, 3]
#   Is Return Value Used? - No, but displayed on line 7
  
# Line 1-4:
#   Action - block execution
#   Object - Each sub-array
#   Side Effect - None
#   Return Value - 1, 3
#   Is Return Value Used? - Yes, by map for transformation
  
# Line 2:
#   Action - method call (puts)
#   Object - Integer at index 0 of each sub-array
#   Side Effect - Outputs a string representation of an integer.
#   Return Value - nil
#   Is Return Value Used? - No

# Line 3:
#   Action - method call (first)
#   Object - Each sub-array
#   Side Effect - none
#   Return Value - Element at index 0 of sub-array
#   Is Return Value Used? - Yes, used to the determine return value of block



# EXAMPLE 4.
#
# my_arr = [[18, 7], [3, 12]].each do |arr|
#   arr.each do |num|
#     if num > 5
#       puts num
#     end
#   end
# end
#
# Line 1:
#   Action - variable assignment (my_arr)
#   Object - The return of method call (each)
#   Side effect - none
#   Return Value - None
#   
# Line 1:
#   Action - method call (each)
#   Object - Outer array
#   Side effect - none
#   Return Value - The calling object [[18, 7], [3, 12]]
#   Is Return Value used? - Yes, the returned value is assigned to my_arr
#
# Line 1-7:
#   Action - Block execution
#   Object - Each sub-array
#   Side Effect - None
#   Return Value - Each sub-array
#   Is Return Value used? - No
#
# Line 2:
#   Action - Method call (each)
#   Object - Each sub-array
#   Side Effect - none
#   Return Value - the calling object: sub-array in current iteration
#   Is Return Value used? Yes, to determine the return value of outer block, which
#     will not use the return value.
#     
# Line 2-6:
#   Action - inner-block execution 
#   Object - Each index of the current sub-array
#   Side effect - None
#   Return Value - nil
#   Is Return Value Used? - No
#
# Line 3:
#   Action - comparison (>)
#   Object - element of sub-array in that iteration and integer (5)
#   Side effect - None
#   Return Value - True or False
#   Is Return Value Used? - Yes, used by If statement to determine execution path.
#
# Line 3-5:
#   Action - conditional (if)
#   Object - The result of the expression num > 5
#   Side Effect - None
#   Return Value nil
#   Is Return value Used? - Yes, used to determine the return value of inner block
#   
# Line 4:
#   Actions - method call (puts)
#   Object - Each index of sub-array
#   Side effect: outputs a string representation of an integer
#   Return Value - nil
#   Is Return Value Used? - Yes, used to determine the return value of the conditional
#   statement if the condition is met.
#
# EXAMPLE 5
 [[1, 2], [3, 4]].map do |arr|
   arr.map do |num|
     num * 2
   end
 end

# Line 1:
#   Action: method call (map)
#   Object: [[1, 2], [3, 4]] 
#   Side Effect: none
#   Return Value: new array [[2, 4], [6, 8]]
#   Return Value Used? No

# Line 1-5:
#   Action: outer block execution
#   Object: each sub array
#   Side Effect: none
#   Return Value: a new sub-array
#   Return Value Used?: Yes, used by top-level #map for tranformation

# Line 2:
#   Action: method call (map)
#   Object: Each sub-array
#   Side Effect: none
#   Return Value: A new version of sub-array in current iteration
#   Return Value Used?: Yes. By outer-block to determine return value
#
# Line 2-4 
#   Action: inner block execution 
#   Object: Element of the sub-array in that iteration
#   Side Effect: None
#   Return Value: Integer
#   Return Value Used?: Yes, by inner-block #map for transformation
#
# Line 3:  
#   Action: method call (*) with int 2 as argument
#   Object: Each element of current iteration sub-array
#   Side Effect: none
#   Return Value: integer
#   Return Value Used?: Yes, used to determine inner-block value

# Example 6:

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
#   hash.all? do |key, value|
#     value[0] == key.to_s
#   end
# end
# => [{ :c => "cat" }]


# Line 1:
#   #select called on array of hashes
# Line 2:
#   #all? called on each sub-hashe
#     will return true if each key-value pair meets a given criterion
# Line 3:
#   Comparison of first letter of each value in key-value pair and
#   the key.
#
# Summary:
#   #select returns a new array of hashes only containing the hashes of
#   the caller that meet the criteria of the #all? method
#
#   #all? return true if each key-value pair in the current sub-hash have
#   a value that's first letter is the same as the key to string.
#
#   if we used #any? instead of #all? all of the hashes would be returned
#   by #select. #any would find key-value pair "a: 'ant'" and return true
#   for that hash where #all? returns false.
#
arr = [1, 2]`
arr.sort_by

#
#
#   Action
#   Object
#   Side Effect
#   Return Value
#   Return Value Used?
#   
#   Action
#   Object
#   Side Effect
#   Return Value
#   Return Value Used?
#   
#   Action
#   Object
#   Side Effect
#   Return Value
#   Return Value Used?
#   
#   Action
#   Object
#   Side Effect
#   Return Value
#   Return Value Used?
#   
#   Action
#   Object
#   Side Effect
#   Return Value
#   Return Value Used?
#   
#   Action
#   Object
#   Side Effect
#   Return Value
#   Return Value Used?
