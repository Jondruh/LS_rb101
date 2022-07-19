# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit(collection)
#   produce_keys = collection.keys
#   counter = 0
#   selected_fruits = {}

#   loop do
#     break if counter == produce_keys.size

#     current_key = produce_keys[counter]
#     current_value = collection[current_key]

#     if current_value == "Fruit"
#       selected_fruits[current_key] = current_value
#     end

#   counter += 1
#   end

#   selected_fruits


# end

# puts select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}

# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size
    
#     numbers[counter] *= 2

#     counter += 1
#   end
  
# end

# array = [1, 3, 4, 8, 9]

# double_numbers!(array)
# p array

my_numbers = [1, 4, 3, 7, 2, 6]

# def double_odd_indices(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_num = numbers[counter]
    
#     if counter.odd?
#       current_num *= 2
#     end

#     doubled_numbers << current_num

#     counter += 1
#   end

#   doubled_numbers
# end
  
# puts double_odd_indices(my_numbers)

def multiply(numbers, multiply_by)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * multiply_by

    counter += 1
  end

  multiplied_numbers
end

p multiply(my_numbers, 3)
