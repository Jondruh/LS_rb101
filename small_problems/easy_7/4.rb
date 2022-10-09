#PROCESS
# write a #swapcase clone
#
# input
#   a string
# output
#   a new string
#
# given a string return a new string with all of the letter cases swapped
#
#EXAMPLE
#
#DATA
#
#ALGORITHM
# Given a string
# examine each character and swap it's case
# return the new string

def swapcase(string)
  array = string.chars
  array.each do |char|
    if char.match?(/['a-z']/)
      char.upcase!
    elsif char.match?(/['A-Z']/)
      char.downcase!
    end
  end
  array.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv' 
