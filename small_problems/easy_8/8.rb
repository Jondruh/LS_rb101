def double_consonants(string)
  new_string = ''
  string.each_char do |letter|
    if letter =~ /[bcdfghjklmnpqrstvwxys]/i
      new_string << letter * 2
    else
      new_string << letter
    end
  end
  new_string
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
