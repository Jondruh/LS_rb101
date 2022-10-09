require "pry"
DIGITS = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0, 'A' => 10, 'B' => 11,
          'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15 }

binding.pry
def string_to_integer(string)
  # place = 10 ** (string.length - 1)
  # sum = 0
  
  array = string.chars.map { |char| DIGITS[char] }

  array.reduce do |memo, operand|
    10 * memo + operand
  end

  # array.each do |num|
  #   sum = 10 * sum + num
  # end
  # array.each do |num|
  #   sum += num * place
  #   place = place / 10
  # end
  
  # p sum 
end

def hexadecimal_to_integer(string)
  array = string.chars.map { |char| DIGITS[char.upcase] }

  array.reduce do |memo, operand|
    16 * memo + operand
  end
end

def string_to_signed_integer(string)
  array = string.chars
  sign = 1

  if array[0] == "+"
    array.shift
  elsif array[0] == "-"
    array.shift
    sign = -1
  end

  array.map! { |char| DIGITS[char] }

  num = array.reduce do |memo, operand|
    10 * memo + operand
  end

  sign * num
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

puts hexadecimal_to_integer('4D9f') == 19871
puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
