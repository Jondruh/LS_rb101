# ask the user for two number
# ask the user for an operation to perform
# perform the operation the two numbers
# output the result

require 'yaml'

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  /^\d+$/.match?(num) # returns false if anything but digits
end

def number?(num)
  valid_number?(num) || float?(num)
end

def float?(num)
  /\d/.match?(num) && /^-?\d*\.?\d*$/.match?(num) # checks for float nums
end

def operation_to_message(op)
  case op
  when '1'
    choice = MESSAGES['operator_choice'][0]
  when '2'
    choice = MESSAGES['operator_choice'][1]
  when '3'
    choice = MESSAGES['operator_choice'][2]
  when '4'
    choice = MESSAGES['operator_choice'][3]
  end

  # something = 'example for assignment'
  # Placeholder to demonstrate safer return value for method

  choice
end

loop do
  prompt("Please choose a language: 1) English 2) Deutsch")
  language = gets.chomp

  case language
  when '1'
    MESSAGES = YAML.load_file('calculator_messages_english.yml')
  when '2'
    MESSAGES = YAML.load_file('calculator_messages_deutsch.yml')
  end

  break if defined? MESSAGES
  prompt("Please choose a valid option")
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['greeting'] + name)

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_num'])
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt(MESSAGES['not_valid'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_num'])
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt(MESSAGES['not_valid'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['not_valid_operator'])
    end
  end

  prompt("#{operation_to_message(operator)} #{MESSAGES['operator_message']}")

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("#{MESSAGES['result_is']} #{result}")

  prompt(MESSAGES['perform_another?'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thank'])
