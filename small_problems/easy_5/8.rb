# PROCESS
#   Write a method that takes a string
#   returns a new string
#   new string contains the value of the original string with all
#   consecutive duplicate characters collapsed into a single character.
#
#   -May not use #squeeze
#   -new string returned
#
# EXAMPLES
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
#
# DATA
#   arrays
#   strings
#
# ALGORITHM
#   given a string
#   make a new string = ""
#   loop counter = 0
#   loop
#     SET current = first letter of given string
#     IF the next character equals the set character
#       counter += 1
#     ELSE IF the next character does not equal the set character
#       push current character to new string
#       counter += 1
#     BREAK IF loop counter = string length - 1
#   end loop
#   RETURN new_string
#

def crunch(string)
  new_string = ''
  loop_counter = 0

  loop do
    if string[loop_counter] != string[loop_counter + 1]
      new_string << string[loop_counter]
    end
    loop_counter += 1

    break if loop_counter >= string.length
  end
  
  new_string
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
