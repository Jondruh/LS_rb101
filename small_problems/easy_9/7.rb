def swap_name(string)
  first, last = string.split
  last + ", " + first
end
puts swap_name('Joe Roberts') == 'Roberts, Joe'
