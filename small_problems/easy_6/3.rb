#PROCESS
# input
#   integer
# output
#   index of fibonacci with input's length
#
# Index of fibonacci starts at 1.
#
#EXAMPLES
#
#DATA
# integers
#
#ALGORITHM
# given an integer length
# 
# index_counter = 2
# first_fib = 1
# second_fib = 1
# 
# UNTIL second_fib length is equal to the given length
#   placeholder = first_fib
#   first_fib = second_fib
#   second_fib = second_fib + placeholder
#   increment index_counter
# END
#
# RETURN index_counter

def find_fibonacci_index_by_length(length)
  first_fib = 1
  second_fib = 1
  index_second_fib = 2

  until second_fib.to_s.length >= length
    placeholder = first_fib
    first_fib = second_fib
    second_fib += placeholder
    index_second_fib += 1
  end
  index_second_fib
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
