#Time to solve: 13min
#P
# Write a method that takes a string as an argument
# return true if all parentheses in the string have a valid match
# pairs must start with ( not ).
# It's not just the count of each
#
# How do you count a valid pair?
#   iterate over each character in a string
#   count the parantheses. open: ( -  close: )
#   if the close count is ever greater than the open count return false
#   if the end of the count is reached and open != close return false
#
# Make this method return data for [], '', "", {}, ()
#

def balanced?(string)
  count = { square: 0, curly: 0, single: 0, double: 0, paren: 0 }
  
  string.chars.each do |letter|
    case letter
    when '(' then count[:paren] += 1
    when ')' then count[:paren] -= 1
    when '{' then count[:curly] += 1
    when '}' then count[:curly] -= 1
    when '[' then count[:square] += 1
    when ']' then count[:square] -= 1
    when "'" then count[:single] == 0 ? count[:single] += 1 : count[:single] -= 1
    when '"' then count[:double] == 0 ? count[:double] += 1 : count[:double] -= 1
    end
    
    return false if count[:square] < 0 || count[:curly] < 0 || count[:paren] < 0
  end

  count.values.all? { |val| val == 0 }
end


puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
puts balanced?('"why?", she asked( ( ))'' ""') == true
puts balanced?('why" she asked"" (()) ') == false
