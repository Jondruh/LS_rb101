#PROCESS
# given an integer, return it multiplied by 2 UNLESS it is a double number
#
#ALGORITHM
# given a number
# check to see if is a double number
#   compare first half to second half to see if they are equal
#     convert integer to string
#     find string length to determine middle point
#     compare first half to second half
#   return it if it is
# otherwise multiply the number by 2 and return it
#
def double?(int)
  str = int.to_s
  return false if str.length <= 1 
  
  middle = str.length / 2

  str[0..middle - 1] == str[middle..-1]
end

def twice(int)
  return int if double?(int)
  int * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
