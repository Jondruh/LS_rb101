# PROCESS THE PROBLEM
#   Inputs
#     positive integer
#   Outputs
#     string
#
#   return a string of alternating 1s and 0s where the length of the string
#   equals the input integer.
#
#   Start the string with a 1.
#
# EXAMPLES
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
#
# DATA
#  use the input to determine the length of the generated string
#
# ALGORITHM
#   Given INPUT
#
#   time = 1
#
#   Loop INPUT times
#
#     On each odd time
#       add a 1 to the end of the string
#     On each even time
#       add a 0 to the end of the string
#
#     increment time
#
#   END
#
# CODE!

def stringy(int, odd_even = 1)
  string = ""
  counter = odd_even

  int.times do
    string << "1" if counter.odd?
    string << "0" if counter.even?
    counter += 1
  end

  string
end

puts stringy(6)
puts stringy(9, 0)
puts stringy(4)
puts stringy(7)
