#Time to solve: 16min
#PROCESS
# write a method that returns a symbol based on what type of triangle it's 3
# arguments would make
#
#to be a valid triangle:
# short_side + short_side > long_side
# all sides > 0
#
#:euilateral
# side1 = side2 = side3
#
#:isosceles
# (side1 = side2) != side3
#
#:scalene
# side1 != side2 != side3
#
#
# Given 3 floats or integers as arguments
#   check that all sides are greater than 0
#     return :invalid if not
#   sort the three arguments and check if the two smallest are greater than long
#   side
#     return :invalid if not
#
#   If all three sides are the same
#     return :equilateral
#
#   If 2 sides are equal while third is different
#       - a = b || a = c
#     return :isosceles
#
#   Else
#     return :scalene
#
def triangle(a, b, c)
  sorted = [a, b, c].sort
  
  return :invalid if [a, b, c].include?(0)
  
  return :invalid if sorted[0] + sorted[1] <= sorted[2]

  return :equilateral if sorted.all?(a)

  return :isosceles if a == b || a == c

  :scalene
  
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid 
