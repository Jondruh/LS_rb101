#PROCESS
# Write a method that takes a string and returns a new string with every other
# letter capitilized.
#
# -the first letter of the string should be the first to be capitilized.
# -spaces and non-alphabet characters should not change but should count in the
# every-other count.
#
# EXAMPLES
# DATA
#  strings
#  arrays?
#
# ALGORITHM
#   Given a string
#   copy the string
#   Lowercase the whole string
#   Upper case every even-indexed letter in the string
#   return the new string
#
require "pry"

# def staggered_case(string)
#   new_string = string.downcase.chars
#   new_string.each_with_index do |letter, index|
#     new_string[index].upcase! if index.even?
#   end
#   new_string.join
# end

def staggered_case(string, alphabet_count = false)
  counter = 0
  new_string = string.downcase.chars

  new_string.each do |char|
    char.upcase! if counter.even?

    if alphabet_count == true
      counter += 1 if char.match?(/[a-z]/i)
    elsif alphabet_count == false
      counter += 1
    end
  end

  new_string.join
end

puts staggered_case('I Love Launch School!', true) == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
