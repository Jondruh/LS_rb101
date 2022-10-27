def sequence(num)
  num > 0 ? (1..num).to_a : (num..1).to_a
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(-3) == [-3, -2, -1, 0, 1]
puts sequence(0) == [0, 1]
