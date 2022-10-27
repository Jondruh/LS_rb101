result = (1..5).inject do |memo, num|
  puts "This is the memo: #{memo}"
  puts "This is the num: #{num}"
  memo.to_s << num.to_s
end

puts result
