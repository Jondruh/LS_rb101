require "pry"

def test
  method_var = "hello"
  if false then 
    method_var_2 = "bye"
  end
  binding.pry
end

binding.pry

var = "yo"
if false then
  var_2 = "seeya"
end

test

binding.pry
