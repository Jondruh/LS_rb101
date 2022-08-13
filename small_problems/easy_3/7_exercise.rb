# PROCESS
#   Create a function that returns a boolean: true or false based on two
#   arguments given to it.
#   - If both arguments are truthy it returns false.
#   - If neither argument is truthy return false.
#   - If only one of the arguments is truthy return true
#
# ALGORITHM
#   given two arguments
#   Return false if neither of the arguments is a truthy value
#   Return false if both of the arguments are truthy values
#   Otherwise return true

# def xor?(arg1, arg2)
#   return false if arg1 && arg2
#   return false if !arg1 && !arg2
#   return true
# end

def xor?(arg1, arg2)
  !!((arg1 && !arg2) || (arg2 && !arg1))
end

# EXAMPLES
puts xor?(5.even?, 4.even?) # == true
puts xor?(5.odd?, 4.odd?) # == true
puts xor?(5.odd?, 4.even?) # == false
puts xor?(5.even?, 4.odd?) # == false
