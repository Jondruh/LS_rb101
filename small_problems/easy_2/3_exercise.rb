# The program should prompt for a bill amount and a tip rate.
# The program must compute the tip and then display both the tip
# and the total amount of the bill.
#
# PROCESS
#   inputs: Bill amount, tip rate
#   outputs: tip, tip + total amount
#
# EXAMPLES
#  What is the bill? 200
#  What is the tip percentage? 15

#  The tip is $30.0
#  The total is $230.0
#
# DATA
#   Will take input strings and convert to float numbers before calculating.
#   Then we will interpolate results into printed strings
#
# ALGORITHM
#   Ask for and save the bill amount
#   Ask for the tip percentage and save it in a perentage format
#   Multiply the tip percentage by the bill and save the number as the tip amount
#   Display the tip amount
#   Add the tip amount and the bill amount and display the resulting sum

puts "What is the bill?"
bill = gets.chomp.to_i

puts
puts "What is the tip percentage?"
tip = gets.chomp.to_f * 0.01

tip_amount = (tip * bill)

puts "The tip is $" + format('%.2f', tip_amount)
puts "The total is $" + format('%.2f', (tip_amount + bill))


