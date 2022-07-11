# 1
def question_1(art)
  10.times do
    puts art
    art.prepend(" ")
  end
end

question_1("The Flintstones Rock!")

# 2
puts "the value of 40 + 2 is " + (40 +2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

# 3
def factors(number)
  divisor = number
  factors = []
  if number > 0 
    loop do
      factors << number / divisor if number % divisor == 0
      divisor -= 1
      break if divisor == 0
    end
  
  elsif
    puts "I'm sorry, that isn't a valid number"
  end
  
  factors
end

p factors(50)
puts factors(0)

# 5
#   The limit variable is out of scope to the method, so the fib method can't
#   "see" the limit variable.


def fib(limit, first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(60, 0, 1)
puts "result is #{result}"

# 6
# Answer: 34
#   integers in Ruby are immutable objects and can't be mutated by the caller.
#   Furthermore, mess_with_it uses a reassignment operator that wouldn't
#   mutate the caller even if integers were mutable
