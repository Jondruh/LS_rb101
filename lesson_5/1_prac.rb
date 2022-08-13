# PROBLEM 1:
# arr = ['11', '10', '9', '7', '8']

# arr.sort! do |a, b|
#   b.to_i <=> a.to_i
# end
# p arr

# arr.sort! do |a, b|
#   a.to_i <=> b.to_i
# end
# p arr

# PROBLEM 2:
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# books.sort_by! do |book|
#   book[:published]
# end

# puts books

# PROBLEM 3:
# arr1[2][1][3]
#
# arr2[1][:third][0]
#
# arr3[2][:third][0][0]
#
# hsh1['b'][1]
#
# hsh2[:third].keys[0]
#

# PROBLEM 4:
# arr1[1][1]= 4
#
# arr2[2]= 4
#
# hsh1[:first][2][0]= 4
#
# hsh2[['a']][:a][2]= 4
#
# PROBLEM 5:
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# age_sum = 0
# munsters.each do |key, value|
#   if value['gender'] == 'male'
#     age_sum += value['age']
#   end
# end
# puts age_sum

# male_munsters = munsters.select do |key, value|
#   value["gender"] == "male"
# end

# Problem 6:

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |name, value|
#   puts "#{name} is a #{value['age']}-year-old #{value['gender']}."
# end

# Problem 8:

# hsh = {
#   first: ['the', 'quick'],
#   second: ['brown', 'fox'],
#   third: ['jumped'],
#   fourth: ['over', 'the', 'lazy', 'dog']
#   }

# hsh.each_value do |array|
#   array.each do |string|
#     string.each_char { |c| puts c if c.match?(/[aeiou]/) }
#   end
# end

# Problem 9

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# sorted_arr = arr.map do |array|
#   array.sort { |a, b| b <=> a }
# end

# p sorted_arr

# Problem 10

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# new_arr = arr.map do |hash|
#   hash.transform_values do |value|
#     value + 1
#   end
# end

# new_arr = arr.map do |hash|
#   new_hash = {}
#   hash.each_pair do |key, value|
#     new_hash[key] = value + 1
#   end
#   new_hash
# end
# p new_arr
 
# PROBLEM 11

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# new_arr = arr.map do |array|
#   array.reject do |int|
#     int % 3 != 0
#   end
# end

# p new_arr

# PROBLEM 12

# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# sorted_arr = arr.sort_by do |array|
#   array.reject { |int| int % 2 == 0 }
# end

# p sorted_arr

# PROBLEM 14
 
# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# array = []
# hsh.each_pair do |key, value|
#   if value[:type] == 'fruit'
#     array << value[:colors].map { |color| color.capitalize }
#   elsif value[:type] == 'vegetable'
#     array << value[:size].upcase
#   end
# end

# p array

# PROBLEM 15

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# new_array = arr.reject do |hash|
#   hash.any? do |key, value|
#     value.any? do |int|
#       int.odd?
#     end
#   end
# end

# p new_array
require "securerandom"

def create_uuid
  hexidecimals = %w[1 2 3 4 5 6 7 8 9 a b c d e f]
  dash_positions = [8, 13, 18, 23]
  uuid = ""
  32.times do
    uuid << hexidecimals.sample
  end
  dash_positions.each do |index|
    uuid.insert(index, "-")
  end
  uuid
end

puts SecureRandom.uuid 
puts create_uuid

counter = 0
loop do
  a = create_uuid
  b = create_uuid
  if a == b
    puts counter
    break
  end
  counter += 1
  if counter % 20000 == 0
    puts counter
    puts a
    puts b
  end
end
