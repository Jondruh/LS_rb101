flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

# counter = 0

# flintstones.map! do |ele|
#   array = []
#   array.push(ele, counter)
#   counter += 1
#   array
# end

# puts flintstones.to_h


# counter = 0
# 
# loop do
#   break if counter == flintstones.size
#   
#   flintstones_hash[flintstones[counter]] = counter
#   counter += 1  
# end

flintstones.each_with_index do |ele, index|
  flintstones_hash[ele] = index
end

puts flintstones_hash


