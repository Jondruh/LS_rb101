#time to solve = 15min
#procedural_fibo time to solve = 9min
#PROCESS
# Write a recursive fibonacci sequence method that calculates the nth fibo
# number.
#
# recursive methods call themselves at least once
# they have a stop condition
# the use the result returned by themselves
#
# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2
#
#
#ALGORITHM
# FIBONACCI(n)
#   return 1 if n < 3
#   sum += FIBONACCI(n - 1) + FIBONACCI(n - 2)
#   sum
# end
#
# procedural_fibo
#   given a number
#   first = 1
#   second = 1
#   total = 0
#   loop number of times - 2
#     total = first + second
#     first = second
#     second = total
#   end loop
#   
#   return total
#     
#     

require "pry"

def F(n)
  return 1 if n < 3
  F(n - 1) + F(n - 2)
end


def fibo_tail(n, acc1, acc2)
  if n == 1
    acc1
  elsif n == 2
    acc2
  else
    fibo_tail(n - 1, acc2, acc2 + acc1)
  end
end

def fibo(n)
  fibo_tail(n, 1, 1)
end

def procedural_fibo(n)
  first = 1
  second = 1
  sum = 0

  (n - 2).times do |_|
    sum = first + second
    first = second
    second = sum
  end

  sum
end

def last_fibo(n)
  last_2 = [1, 1]
  3.upto(n) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
end

puts last_fibo(123_456_789)
