#Process
# two functions
#   after_midnight
#     inputs
#       string in 'hh:mm' format
#     outputs
#       integer representing the minutes after midnight
#
#   befre_midnight
#     inputs
#       string in 'hh:mm' format
#     outputs
#       integer representing the minutes before midnight
#Examples
#
#Data
# strings
# integers
#
#ALGORITHM
# BOTH functions
#   convert hours and minutes to just minute integers
#     select hours and multiple the number by 60
#     add hours to the minutes
#
# for #after_midnight
#   IF
#     the total minutes is 1440
#     RETURN 0
#   RETURN the total minutes
#
# for #before_midnight
#   IF
#     the total minutes is zero return zero,
#   
#   ELSE
#     take the total minutes and subtract them from 1440


def after_midnight(string)
  hours = string[0..1].to_i
  minutes = string[3..4].to_i
  total_minutes = (hours * 60) + minutes

  return 0 if total_minutes == 1440
  total_minutes
end

def before_midnight(string)
  hours = string[0..1].to_i
  minutes = string[3..4].to_i
  total_minutes = (hours * 60) + minutes

  return 0 if total_minutes == 0
  1440 - total_minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
