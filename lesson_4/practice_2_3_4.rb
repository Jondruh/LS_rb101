ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


# ages_summed = 0
# ages.each_value { |age| ages_summed += age }
# puts ages_summed




# ages_summed = 0
# counter = 0

# loop do
#   break if counter == ages.size
#   keys = ages.keys
  
#   ages_summed += ages[keys[counter]] 

#   counter += 1
# end

# puts ages_summed

# PROBLEM 3

# ages.reject! { |key, value| value >= 100 }
# puts ages


# PROBLEM 4
p ages.min[1]
