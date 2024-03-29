# Process
#   take two strings
#   find which string is longer
#   concencate the short on either side of the long string
#     ("short", "longer") == "shortlongershort"
#   return that concencation
#
def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
