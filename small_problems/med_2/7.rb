#Time to solve: 21min
#PROCESS
# write a method that takes the year-date as an argument
# return how many friday the 13ths are in the given year
#
# assume that the year is greater than 1752
#
#
# given a year
# find all the days that are fridays
# return the count of how many thirteens are there
#
# given a year
# find all months that have 5 fridays in them
# make a months hash where key = month and value = number of fridays
# 
# find the first friday of the first month
#  loop through the fridays while the date remains the same year
#   update the value for that month
# once all of the days have been checked
# return the keys for the values that are 5
# 
require "date"

def num_months_5_fridays(year)
  friday_count = {}

  dates = Date.new(year)

  until dates.friday?
    dates = dates.next
  end

  while dates.year == year
    if dates.friday?
      if !friday_count[dates.month]
        friday_count[dates.month] = 1
      else
        friday_count[dates.month] += 1
      end
    end
    dates = dates + 7
  end

  friday_count.select do |key, value|
    value > 4
  end
end

def friday_13th(year)
  days = Date.new(year)
  counter = 0

  days_in_year = days.leap? ? 366 : 365
  
  days_in_year.times do
    check = days.strftime("%d %A").split
    counter += 1 if check[0] == '13' && check[1] == 'Friday'
    days = days.next
  end
  counter
end

puts num_months_5_fridays(1992)
# puts friday_13th(2015) #== 3
# puts friday_13th(1986) #== 1
# puts friday_13th(2019) #== 2
