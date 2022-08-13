# Write a program that will ask for user's name. The program will then greet the user.
# If the user writes "name!" then the computer yells back to the user.

# PROCESS
#   inputs: user's name
#   outputs: greeting

#   Explicit reqs:
#     - If username ends with "!" all caps the return greeting, and extend it.
#     - If username does not end with "!", just reply.

puts "What is your name?"
username = gets.chomp

if username.end_with?("!")
  username.delete_suffix!("!").upcase!
  puts "HELLO, #{username}. WHY ARE WE SHOUTING?"

else
  puts "Hello, #{username}"
end
