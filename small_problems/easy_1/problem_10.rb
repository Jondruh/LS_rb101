# PROCESS
#   inputs:
#     a positive integer
#     a boolean
#   outputs:
#     an integer
#
#   if boolean is false return 0
#   if the boolean is true return half the given integer
#
#   how should it deal with halving an odd number? rounding or decimals
#     - To keep things simple I will let ruby round the number.
#   
# EXAMPLES
#   see below
#    
# DATA
#   we are taking an integer and outputing an integer, we may need to use float on
#   output and for calculating.
#   
# ALGORITHM
#   First check the boolean argument
#     if boolean = false
#       return 0
#
#     if boolean = true
#       half the integer argument
#       return the halved integer
#   
# CODE

def calculate_bonus(integer, bonus)
  if bonus
    integer / 2
  else 
    0
  end
  # bonus ? (integer / 2) : 0
end

puts calculate_bonus(1331, true)  == 665
puts calculate_bonus(2800, true)  == 1400
puts calculate_bonus(1000, false)  == 0
puts calculate_bonus(50000, true)  == 25000

