a = [0, 0]

until a.include?(3)
  p a
  a.each_index { |_| a[0] += 1 }
end
