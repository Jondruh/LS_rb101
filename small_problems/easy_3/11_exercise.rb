def palindromic_number?(num)
  test_string = num.to_s
  test_string == test_string.reverse
end
# option without converting to a string
def palindrom_num?(num)
  reversed = 0
  number = num
  until num == 0
    last_digit = num % 10
    reversed = (reversed * 10) + last_digit
    num = num / 10
  end
  return true if reversed == number
end

puts palindrom_num?(001232100) == true
puts palindromic_number?(0345430) == true
puts palindromic_number?(00123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
