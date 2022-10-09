# PROCESS
#   given a floating point number that reperesnts an angle
#   return a string that represents that angle in degrees, minutes and seconds.
#   -Use DEGREE = "\xC2\xB0" for the degree symbol
#   -Use ' to represent minutes
#   -Use " to represent seconds
#
#   A degree has 60 minutes
#   A minute has 60 seconds
#   
# EXAMPLES
#
# DATA
#   floats
#   strings
#
# ALGORITHM
#   Given a float
#   Initialize variables for degrees, minutes and seconds with 0 as the default
#   
#   take the number before the decimal point and save it as the degrees
#   
#   IF there is a number after the decimal point
#     multiply it by 60 and divide that result by 100
#      (num * 60) / 100
#     save that result as the minutes
#     save the remainder to be operated on
#     IF there is a remainder
#       (remainder * 60) / 100
#       save that result as the seconds
#
#   Format the degrees, minutes and seconds as a string "00:00:00" with the appropriate
#   symbols.
require "pry"
DEGREE = "\xC2\xB0"

def dms(angle)
  degrees, fractional = angle.to_s.split('.')
  minutes = "00"
  seconds = "00"
  if fractional
    fractional = "0." + fractional
    
    minutes, remainder = (fractional.to_f * 60).to_s.split('.')
    minutes = sprintf("%02d", minutes)
    if remainder
      remainder = "0." + remainder
      seconds = sprintf("%02d", (remainder.to_f * 60).round)
    end
  end
  "(#{degrees}#{DEGREE}#{minutes}'#{seconds})"
end

puts dms(30) # == %(30°00'00")
puts dms(76.73) # == %(76°43'48")
puts dms(254.6) # == %(254°36'00")
puts dms(93.034773) # == %(93°02'05")
puts dms(0) # == %(0°00'00")
puts dms(360) # == %(360°00'00") || dms(360) == %(0°00'00")
