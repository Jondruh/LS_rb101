def leading_substrings(string)
  subs = []
  string.length.times do |num|
    subs << string[0..num]
  end
  subs
end

def substrings(string)
  substrings = []
  string.length.times do |num|
    substrings << leading_substrings(string[num..-1])
  end
  substrings.flatten
end

def palindromes(string)
  substrings(string).select do |sub|
    modified = sub.downcase.gsub(/[^a-zA-Z0-9]/, "")
    modified.reverse == modified && modified.length > 1
  end
end

# puts leading_substrings('abc') == ['a', 'ab', 'abc']
# puts leading_substrings('a') == ['a']
# puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# puts substrings('abcde') == [
#    'a', 'ab', 'abc', 'abcd', 'abcde',
#    'b', 'bc', 'bcd', 'bcde',
#    'c', 'cd', 'cde',
#    'd', 'de',
#    'e'
#  ]

puts palindromes('abcd')# == []
puts palindromes('madam') #== ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye')# == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
puts palindromes('knitting cassettes') #== [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
