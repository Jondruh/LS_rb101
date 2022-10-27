#PROCESS
#  write a method that takes a rational number and returns an array of
#  all the denominators of egyptian fractions that add up to the rational
#  number
#
#  Egyptian fractions representation of a number is when you add a fractions
#  up to a number using only fractions with numerators of 1 and never repeat
#  a denominator.
#
#EXAMPLES

#DATA
# arrays
# Rational Class

#ALGORITHM
# given a rational number
# Find a series of egyptian fractions that add up to the given number
#  Create a new array []
#  create a counter = 1
#  LOOP
#  if sum of the array is less than the given number
#    push rational(1, counter) into the array
#    iterate counter 1
#  if the sum of the array is greater than the given num
#    Remove the last rational in the array
#    add the next smallest fraction 
#    iterate counter 1
#  if sum of array exactly equals the given num
#    Return an array of the denominators of the egyptian fractions.
#  END
#
#ALGORITHM unegyptian
#  given an array of numbers which represent denominators of eygptian fractions
#  Place a numerator of 1 over each number and add them all together
#    sum = nil
#    for each in the array
#      sum = sum + Rational(1, each) 
#    return sum

def egyptian(rational)
  array = []
  counter = 1
  
  loop do
    if array.sum < rational
      array << Rational(1, counter)
      counter += 1
    elsif array.sum > rational
      array.pop
      array << Rational(1, counter)
      counter += 1
    elsif array.sum == rational
      return array.map { |rational| rational.denominator }
    end
  end
  
end

def unegyptian(array)
  array.inject(Rational(0, 1)) do |memo, num|
     memo + Rational(1, num)
  end
end


p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)