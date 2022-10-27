#Time to solve: 17min
#PROCESS
# given an integer
# return the next 'featured num'
# A featured num is
#   -an odd number
#   -a multiple of 7
#   -a number who's digits have no duplicates
#
# Return an error message if there is no next featured number
# (Anything greater than 9_999_999_999 can not have each digit be unique)

#ALGO
# given an integer
# find the next featured number greater than the integer
#   from the int up to 9_999_999_999
#   check if is odd AND if it is a multiple of seven AND
#   if it has no duplicated numbers.
#
#   Check for duplicated
#     given a number
#     convert it to a string
#     convert the string to an array where each character is an element
#     iterate over each character return false if character count is > 1
#
#   if the three conditions are met return the number
#   otherwise return an error message that there is not featured number.
#
require 'benchmark'
require 'pry'

# def featured(num)
#   (num + 1).upto(9_999_999_999) do |number|
#      if number.odd? && number % 7 == 0 && unique?(number)
#        return number
#      end
#   end
  
#   "ERROR: There is no featured number greater than the given number."
# end

def featured(num)
  num += 1
  num += 1 until num.odd? && num % 7 == 0

  until num > 9_876_543_210
    return num if unique?(num)
    num += 14
  end

  "ERROR: There is no featured number greater than the given number."
end

def unique?(num)
  list = num.to_s.chars
  
  list.each do |letter|
    return false if list.count(letter) > 1
  end
  
  return true
end

time = Benchmark.measure {
  puts featured(12) == 21
  puts featured(20) == 21
  puts featured(21) == 35
  puts featured(997) == 1029
  puts featured(1029) == 1043
  puts featured(999_999) == 1_023_547
  puts featured(999_999_987) == 1_023_456_987
  puts featured(9_999_999_999) #== -> There is no possible number that fulfills those requirements
}
puts time.real
