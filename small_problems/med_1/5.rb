#Time to solve: 15min
#
#PROCESS
# given an odd integer
# write a method that prints a 4-pointed diamond in an n * n grid.
#
#ALGORITHM
# given an integer n
# n times output an odd number of stars
#   starting at one
#   each line add 2 stars until n stars is reached and then
#   work your way back down.
#     until num of stars = n
#       stars += 2
#     end
#
#     stars -= 2
# center the stars and pad them with the integer amount spaces
#
def hollow_star(width)
  star_string = "*"
  if width > 2
    padding = width - 2
    star_string = "*" + (" " * padding)   + "*"
  end
  star_string
end

def diamond(num)
  stars = 1
  until stars == num
    puts ("*" * stars).center(num)
    stars += 2
  end
  until stars < 1
    puts (hollow_star(stars)).center(num)
    stars -= 2
  end
end


diamond(9)

diamond(5)
