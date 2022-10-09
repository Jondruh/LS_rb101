# PROCESS
#   input
#     negative or positive integer of any length representing minutes
#   output
#     string in 24 hh:mm format representing the distance from midnight the input
#     is
#
#   24 hours = 1440 minutes
#
#   Any number outside -1440 to 1440 can be brought
#   to within that range by repeatedly adding or subtracting 1440 until within
#   the range, then operated on without changing the accuracy.
#
# EXAMPLES
#
# DATA
#   strings
#   integers
#   time
#
# ALGORITHM
#   Given an integer, bring the number within +/-1440 by adding or subtracting
#   1440 repeatedly
#
#   OR
#
#   given an integer
#   find the quotient of dividing the minutes by 60
#   find the remainder of that operation and set that as the minutes
#
#   IF the quotient is a negative number less than -24
#     add 24 to it until it's greater than or equal to -24
#   IF the quotient is a positive number greater than 24
#     subtract 24 from it until it's less than or equl to 24
#
#   IF the quotient is a negative number after this
#     subtract the quotient from 24 and put the remainder as the hours
#   IF the quotient is a postive number after this, that number is put as the hours
#
#   Format the hours and minutes as "hh:mm"

def time_of_day(num)
  hours, minutes = num.divmod(60)
  
  if hours > 24
    until hours <= 24
      hours -= 24
    end
  elsif hours < -24
    until hours >= -24
      hours += 24
    end
  end

  if hours.negative?
    hours = 24 + hours
  end

  sprintf('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
