def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |pairs| pairs[0] * pairs[1] }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
