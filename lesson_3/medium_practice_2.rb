# 1.
# (a.object_id == c.object_id) != b.object_id
#
# 2.
# (a.object_id == b.object_id == c.object_id)
#
# 3.
# "My string looks like this now: pumpkins
# "My array looks like this now: [pumpkins, rutabaga]"
#
# The my_string variable is not mutated because += is a reassignment operator,
# reassignment never mutates.
#
# The my_array variable is mutated because #<< mutates the caller.
#
# 5.
# 
# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"
#   return a_string_param, an_array_param
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# my_string, my_array = tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"
#
# 6.
# def color_vaild(color)
#   color == "blue" || color == "green"
# end
