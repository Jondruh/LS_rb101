# 1.
#   the return value of the select method is [1, 2, 3]. This is because the select
#   method evaluates each element in the collection using the block passed to the
#   method. If the block returns a truthy value then the element is added to the new
#   array which #select will return. "hi", a string is the last line of the block
#   being used to evaluate the elements and is truthy. Therefore each element will be
#   added to the new array.
#
# 2.
#   #count treats any truthy return value from the block as an increment. To find
#   that I found #count in the array ruby docs
#
# 3.
#   The return value of #reject is [1, 2, 3]. Because any truthy value in the block
#   will cause the reject method to pass over that element. #puts always returns
#   "nil" and is the last eveluated expression in the block.
#
# 4.
#   {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
#   #each_with_object passes each element to the block along with a collection.
#   The block that is passed with it is adding key/value pairs to the passed in
#   empty hash. #each_with_object returns the collection passed in.
#
# 5.
#   #shift removes the first key/value pair from the hash. It returns the key/value
#   pair as a two-element array: [a:, 'ant']. Find this in the docs: Hash#shift
#
# 6.
#   Returns the #size of the return of #pop. Array#pop is a destructive method that
#   removes the trailing element in an array. In this case 'caterpillar' is removed
#   and #size is called on the string. String#size returns the count of characters
#   in self: 11.  This one got me because I didn't connect that #size was being called
#   on the return of #pop. Not the original array. 
#
# 7.
#   The block's return value is determined by num.odd? as it is the last expression
#   evaluated in the block. So it will return True for [1, 3] and False for [2].
#   #any? returns True if any of the blocks called on each element return a truthy
#   value. In this case #any? returns "true" and outputs only 1. Why? Because #any
#   stops evaluating after the first truthy value it receives because it doesn't need
#   to continue looking to know that it will return "true".     I didn't know that
#   #any? returns true and stops iterating as soon as one truthy value is found in
#   the collection, though it makes sense. Is it safe to assume that any time a
#   method is iterating looking for the existence of one thing that it will return
#   if it finds one?
#
# 8.
#   #take(x) returns the first x number of elements in the array and returns them
#   in a new array. In this case it will return a new array: [1, 2]. It is
#   non destructive which is counter to my intuition.
#
# 9.
#   #map returns an array containing the value that the block called on each element
#   returns. In this case: [nil, 'bear']. There must be a value returned from each
#   block. if none of the branches of an if statement evaluates as true, it returns
#   nil.
#
# 10.
#   [1, nil, nil] #map builds an array of the return values of the block passed into
#   #map. In the first branch of the if statement there is a #puts call. #puts prints
#   num and returns nil (#puts always returns nil). In the else branch, num is
#   returned. The last value evaluated is returned so just the num in that case.
#   #map outputs 2 and 3.
