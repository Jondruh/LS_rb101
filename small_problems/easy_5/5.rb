# PROCESS
#   -given a string of lowercase words and non-alphabetic charactersg
#   -return a string with all non-alphabetic characters replaced by spacesg
#   -if multiple non-alphabetic characters occur in a row, replace with a
#   single space
#
# EXAMPLE
# cleanup("---what's my +*& line?") == ' what s my line '
#
# DATA
#   -strings
#
# ALGORITHM
#   take string
#   find any non-alphabetic characters
#   replace any consecutive grouping with a space
#   return string

def cleanup(string)
  string.gsub(/[^a-z]+/, " ")
end

puts cleanup("---what's my +*& line?") == ' what s my line '
