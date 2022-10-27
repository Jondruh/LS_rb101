#Time to solve: 8 min
#PROCESS
# write a method that take 3 arguments (the degrees of the 3 angles of a traingle)
# return a symbol based on what kind of triangle it is
# :acute
#   all 3 angles are less than 90 degrees
# :right
#   One of the 3 angles is 90 degrees
# :obtuse
#   One of the angles is greater than 90 degrees
# :invalid
#   All angles must sum to 180 degrees. All angles must be larger than 0
#
# assume the args are integers
# assume the args are degrees
#
# Given 3 args
#   return :invalid if not all the angles > 0 OR angles summed don't equal 180
#
#   return :right if one of the angles equals 90
#
#   return :obtuse if one of the angles is greater than 90
#
#   otherwise return :acute
#
def triangle(a, b, c)
  sized = [a, b, c].sort
  
  return :invalid if sized.include?(0) || sized.sum != 180

  return :right if sized.include?(90)

  return :obtuse if sized.last > 90

  :acute

end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
