#PROCESS
# given a string
# return the middle letter/letters of the string
#
#ALGORITHM
# Given a string
# divide the string by 2 to find the halfway index
# IF there is a remainder, return the quotient index
# IF there is no remainder, return the quotient index and the next letter as well
#
def center_of(string)
  quotient, remainder = string.length.divmod(2)
  
  return string[quotient] if remainder == 1
  
  string[quotient - 1, 2]
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
