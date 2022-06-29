
# PEDAC

# Process
#   Inputs
#     one postive integer
#   Outputs
#     an array containing each of the numbers of the integer

#   Rules
#     Must be positive integer
#     Each place of the integer must be it's own entry in the array
#
# Examples
#   puts digit_list(12345) == [1, 2, 3, 4, 5]     #   => true
#   puts digit_list(7) == [7]                     #   => true
#   puts digit_list(375290) == [3, 7, 5, 2, 9, 0] #   => true
#   puts digit_list(444) == [4, 4, 4]             #   => true
#
# Data
#
# Algorithm
#   take one integer
#   for each significant place of the integer
#   place one number in an array
#   
#
# CODE!
    
# def digit_list(int)
#   a = int.to_s.chars
#   a.map! { |num| num.to_i }
# end

def digit_list(int)
  int.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     #   => true
puts digit_list(7) == [7]                     #   => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] #   => true
puts digit_list(444) == [4, 4, 4]             #   => true

