# 1.
# => "undefined local variable or method" // Actually "nil". variables are initialized
# and contain nil value even in a branch of if statement that isn't run.
# 2.
# "{:a=> "hi there}"
# 3.
# A) "one is one"
#    "two is two"
#    "three is three"
#
#    reassignement never mutates the caller, just changes the pointer, so when we
#    pass one, two and three to the method, 3 new variables are created: "one",
#    "two" and "three" that all point to the same object_id as their corresponding
#    variables outside the method. When we write "one = two" we are pointing the
#    "one" variable inside the method at to the object_id of the "two" variable.
#    This does not change what the "one" variable outside of the method is pointing
#    to, and does not change the string that is held at one.object_id.
#
# B) Same as question A. With almost identical explanation. mess_with_vars is
# pointing it's inner variables at different locations in memory that are holding
# different strings. Again: reassignment never mutates.
#
# C) "one is: two"
#    "two is: three"
#    "three is: one"
#
#    Here, mess_with_vars is calling a mutating method "gsub!" on it's locally
#    initialized variables. This is changing the string values stored at the
#    object_id locations. Therefore the changes are seen in the variables outside
#    the method. 
# 
# 4.
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4 do
    dot_seperated_word.each do |word|
      return false if is_an_ip_number?(word) == false
    end
  end
  elsif
    return false
  end
  return true
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  dot_separated_words.each do |word|
    return false unless is_an_ip_number(word)
  end
  
  true
end

