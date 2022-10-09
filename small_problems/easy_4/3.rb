# PROCESS
#   leap years occur in every year that is evenly divisible by 4.
#     if the year is also evenly divisible by 100 it is NOT a leap year
#       if the year is also evenly divisible by 400 it IS a leap year
#
#   inputs:
#     integer greater than 0
#   outputs:
#     boolean
#       `true` if leap year
#
# EXAMPLES
#  see below
#
# DATA
#   integers
# ALGORITHM
#   given a number divide it by 4
#   IF the remainder is 0
#     divide the number by 100
#       IF the remainder is 0
#         divide the number by 400
#           IF the remainder is 0 return true
#           ELSE return false
#       ELSE return true
# CODE

def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end



puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
