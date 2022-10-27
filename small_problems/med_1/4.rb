#Time to complete 33min
#PROCESS
# write a method that takes an integer as an argument that represents
# a number of lights. Each light is represented by a switch, one being on
# zero being off.
#
# All of the lights are initially off.
# The first pass you toggle all of them on
# The second pass you toggle 2, 4, 6...
# the third pass you toggle 3, 6, 9...
# fourth pass you toggle 4, 8, 12...
#
# And so on until you've done a number of passes equal to the number of lights
# 
#ALGORITHM
# given an integer
# create an array where each element is false and there are integer number of
# elements
# 
# counter = 1
# loop
#   iterate over each element
#     switch element to true if index + 1 is a multiple of the counter
#       index + 1 % counter
#   break if counter = integer
#   counter += 1
# end
#
# given an array
# return an array of the index of the elements that are true in the given array
#
# transform the original array so that each true becomes it's index num plus 1
# after that change select everything that isn't false and return it
# 
require "pry"

def lights(n)
  lights = [false] * n
  counter = 1
  
  loop do
    lights.map!.with_index do |light, index|
      (index + 1) % counter == 0 ? !light : light
    end

    break if counter == n
    counter += 1
  end
  
  lights.map!.with_index do |light, index|
    light ? index + 1 : light 
  end

  lights.select { |light| light } 
end

puts lights(5) == [1, 4]
puts lights(10) == [1, 4, 9]
p lights(1000)
