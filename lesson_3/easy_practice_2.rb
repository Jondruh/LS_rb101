# 1, 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

puts ages.key?("Spot")

# 2.
munsters_description = "The Munsters are creepy in a good way."

puts munsters_description.swapcase!
puts munsters_description.capitalize!
puts munsters_description.downcase!
puts munsters_description.upcase!

# 4, 5, 6, 7 
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.include?("Dino")
puts advice.match?("Dino")

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))
p flintstones

# 8
puts advice.slice!(0, advice.index("house"))
puts advice

# 9
statement = "The Flintstones Rock!"
statement.count("t")

# 10
title = "Flintstone Family Members"
puts title.center(40)

