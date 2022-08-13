def multiply(a, b)
  a * b
end

def power(num, power)
  total = num 

  (power - 1).times do
    total = multiply(total, num)
  end

  total
end

puts power(5, 3)
puts power(-5, 3)
