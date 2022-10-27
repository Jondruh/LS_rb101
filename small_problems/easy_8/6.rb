#PROCESS
# inputs
#   method takes two integers as arguments
# outputs
#   print all numbers between the two numbers with some changes
#
# If a number is divisible by 3 print "Fizz"
# If a number is divisible by 5 print "Buzz"
# If a number is divisible by 3 and 5 print FizzBuzz
#
#DATA
# integers
# arrays
# strings
#
#ALGORITHM
# given two integers
# SET range = []
# SET counter = 1
#
# LOOP
#   put counter in range
#   add 1 to counter
#   BREAK if counter is greater than integer2
# END
#
# SET counter = 0
# LOOP
#   if range[counter] is divisible by 3 and 5
#     p "FizzBuzz, "
#   elsif range[counter] is divisible by 5
#     p "Buzz, "5 ==
#   elsif range[counter] is divisible by 3
#     p "Fizz, "
#   else
#     p range[counter]
#   END
#   BREAK if counter == range length
# END

def fizzbuzz(num1, num2)
  fizzy_array = []
  num1.upto(num2) do |num|
    if num % 3 == 0 && num % 5 == 0
      fizzy_array << "FizzBuzz"
    elsif num % 3 == 0
      fizzy_array << "Fizz"
    elsif num % 5 == 0
      fizzy_array << "Buzz"
    else
      fizzy_array << num
    end
  end
  p fizzy_array
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
