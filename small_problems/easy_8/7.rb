# def repeater(string)
#   doubled_string = ""
#   string.chars.each do |letter|
#     doubled_string << letter * 2
#   end
#   doubled_string
# end

def repeater(string)
  string.chars.zip(string.chars).join
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
