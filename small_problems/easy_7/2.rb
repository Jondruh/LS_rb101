#PROCESS
# input
#   a string
# output
#   a hash
#
# take a string and return a hash that containes 3 entries
#  one with the count of lowercase letters
#  one with the count of uppercase letters
#  one with the count of letters that are neither.
#
#EXAMPLE
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
#
#DATA
# strings
# hashes
#
#ALGORITHM
# create hash
# 
# set lowercase any letter [a-z]
# set uppercase any letter [A-Z]
# set neither to (string length - uppercase letters - lowercase letters)
#
# return hash
#
def letter_case_count(string)
  hash = {}

  hash[:lowercase] = string.count('a-z')
  hash[:uppercase] = string.count('A-Z')
  hash[:neither] = string.length - hash[:lowercase] - hash[:uppercase]

  hash
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
