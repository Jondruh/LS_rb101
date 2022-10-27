#PROCESS
# given an odd integer 7 or greater
# print a star to the screen
#   the middle row should be all stars equal in number to the given int
#   the next row should be three stars center
#   the next row should be those three stars further apart and so on
#   in a line to the outermost lines of the start which should be
#   3 stars, 1 on each end and 1 in the middle
#
#EXAMPLE
#star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
#
#DATA
# strings
#
#ALGO
#
#given an odd integer
# number is equal to integer
# 
# until number = 0 
#   draw 3 stars spaced evenly within the number sizeo
#     make a string of empty spaces equal to number
#     place a star at the first and last indexs of the string
#     place a star at the index -- (number / 2) + 1
#   number equals the number - 2
#
# draw all stars for the integers full length
#
# number = 3
# until number = full length
#   draw 3 stars spaced evenly with the number size
#   number equls plus numbers + 2
#
def star(size)
  width = size

  until width < 3
    print_stars(width, size)
    width -= 2
  end

  puts "*" * size
  
  width = 3

  until width > size
    print_stars(width, size)
    width += 2
  end
end

def print_stars(width, size)
  middle = (width / 2)

  string = " " * width

  string[0], string[-1] = "*", "*"
  string[middle] = "*"

  puts string.center(size)
end

star(211)

