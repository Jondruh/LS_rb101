# Build a program that displays when the user will retire
# and how many years she has to work till retirement.
#
# PROCESS
#   inputs: your age, your retirement age
#   outputs: Current year, Year of retirement, years to go
#
# EXAMPLES
#
#   What is your age? 30
#   At what age would you like to retire? 70

#   It's 2016. You will retire in 2056.
#   You have only 40 years of work to go!
#
# DATA
#   inputs will be strings, we will convert them to integers to do math
#   then interpolate them into strings. We will also be working with dates.
#
# ALGORITHM
#   Get current age and save it
#   Get retirement age and save it
#   Find and display the current year
#   Add the difference of retirement age and current age to the date and display it
#   Display the countdown (same difference as above step)
#
# CODE
# require "date"

# puts "What is your age?"
# current_age = gets.chomp.to_i

# puts "At what age would you like to retire?"
# retirement_age = gets.chomp.to_i

# years_to_work = (retirement_age - current_age)
# current_year = Date.today.year

# puts "It's #{current_year}. You will retire in #{current_year + years_to_work}."
# puts "You only have #{years_to_work} years of work to go!"

puts "What is your age?"
current_age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

years_to_work = (retirement_age - current_age)
current_year = Time.now.year

puts "It's #{current_year}. You will retire in #{current_year + years_to_work}."
puts "You only have #{years_to_work} years of work to go!"


