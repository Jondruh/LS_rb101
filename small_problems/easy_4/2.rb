# PROCESS
#   Take the integer year
#   Calculate which century it is
#   return a string with the appropriate ending attached
# 
# [1] = st
# [2] = nd
# [3] = rd
# [4, 5, 6, 7, 8, 9, 0] = th
# [11, 12, 13] = th
# How to tell what century it is?
#   divide year by 100 and add 1 unless 100 evenly divides the year
#

def century(year)
  divided_year = year.divmod(100)
  
  divided_year[0] += 1 unless divided_year[1] == 0
  
  century_array = divided_year[0].digits.reverse

  if century_array[-1] == 1 && century_array[-2] != 1
    "#{divided_year[0]}st"
  elsif century_array[-1] == 2 && century_array[-2] != 1
    "#{divided_year[0]}nd"
  elsif century_array[-1] == 3 && century_array[-2] != 1
    "#{divided_year[0]}rd"
  else
    "#{divided_year[0]}th"
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
