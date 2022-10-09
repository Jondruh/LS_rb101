#ALGORITHM
# given a positive integer
# build a range from 1 to the integer
# for each number draw that number of stars
#   right justify the stars and pad them with the given integer
#
def triangle(n)
  (1..n).each do |num|
    puts ("*" * num).rjust(n)
  end
end

triangle(5)

triangle(9)
