require "bigdecimal"

def get_monthly_payments(loan_amount, monthly_interest, loan_duration)
  loan_amount *
    (monthly_interest / (1 - (1 + monthly_interest)**(-loan_duration)))
end

def form_num(num) # Converts floats to two decimal place strings
  format('%.2f', num)
end

def float?(num)
  /\d/.match?(num) && /^-?\d*\.?\d*$/.match?(num) # checks for float nums
end

def integer?(num)
  /^\d+$/.match?(num.to_s) # checks for integers
end

def valid_num?(num) # Uses two methods to check if num is a valid input
  integer?(num) || float?(num)
end

def get_loan_amount
  loop do
    puts "Please enter the loan amount in dollars"
    amount = gets.chomp
    return amount.to_i if valid_num?(amount)
  end
end

def get_loan_duration
  loop do
    puts "Please enter the loan duration in months"
    duration = gets.chomp
    return duration.to_i if integer?(duration)
  end
end

def get_interest_rate
  loop do
    puts "Please enter the Annual Percentage Rate. Example: 10.3 for 10.3%"
    rate = gets.chomp
    return BigDecimal(rate) if valid_num?(rate)
  end
end

def get_amount_duration_rate
  loan = get_loan_amount
  duration = get_loan_duration
  rate = get_interest_rate

  return loan, duration, rate
end

def calc(loan_amount, loan_duration, interest_rate)
  monthly_interest = (interest_rate * 0.01) / 12
  monthly_payments =
    (get_monthly_payments(loan_amount, monthly_interest, loan_duration))
  total_to_pay = (loan_duration * monthly_payments)
  total_interest = total_to_pay - loan_amount

  return monthly_interest, monthly_payments, total_to_pay, total_interest
end

def amortization(loan_amount, loan_duration, monthly_interest, monthly_payments)
  table = { balance: [], interest: [], principal: [], ending_bal: [] }
  month = 0
  interest = (loan_amount * monthly_interest)

  loan_duration.times do
    table[:balance][month] = loan_amount
    table[:interest][month] = interest
    table[:principal][month] = (monthly_payments - interest)
    table[:ending_bal][month] = (loan_amount - (monthly_payments - interest))

    interest = table[:ending_bal][month] * monthly_interest
    loan_amount = table[:ending_bal][month]

    month += 1
  end
  table
end

def print_header(alignment) # Prints amortization header at alignment offsets
  header = ["Beginning Balance", "Interest", "Principal", "Ending Balance"]
  string_header = " " * 60
  counter = 0

  header.each do |entry|
    string_header.insert(alignment.fetch(counter), entry)
    counter += 1
  end

  string_header.rstrip!

  puts string_header

  puts("-" * string_header.length)
end

def print_amortization(table, alignment) # Prints table at alignment offsets
  month = 0

  table[:balance].length.times do
    counter = 0
    row = []
    string_row = " " * 60

    table.each { |entry| row.push(entry[1][month]) }

    row.each do |entry|
      string_row.insert(alignment.fetch(counter), form_num(entry))
      counter += 1
    end

    month += 1

    puts string_row.rstrip
  end
end

puts "Welcome to the mortgage calculator!"

loan_amount, loan_duration, interest_rate = get_amount_duration_rate

loop do # Main loop
  monthly_interest, monthly_payments, total_to_pay, total_interest =
    calc(loan_amount, loan_duration, interest_rate)

  puts %{

    Loan amount   > $#{loan_amount}
    Interest Rate > #{form_num(interest_rate)}%
    Loan Duration > #{loan_duration} months

    You will make #{loan_duration} payments of > $#{form_num(monthly_payments)}

    All together you will pay > $#{form_num(total_to_pay)}

    Your total interest payed will be > $#{form_num(total_interest)}

    Options:
      1) Change Loan amount
      2) Change loan duration
      3) Change interesterest rate
      4) Restart the calculator
      5) Calculate amortization table
      6) Exit the Calculator

    }

  option_select = gets.chomp

  case option_select
  when "1"
    loan_amount = get_loan_amount
  when "2"
    loan_duration = get_loan_duration
  when "3"
    interest_rate = get_interest_rate
  when "4"
    loan_amount, loan_duration, interest_rate = get_amount_duration_rate
  when "5" 
    alignment = [0, 20, 40, 60]
    table = amortization(loan_amount,
                         loan_duration,
                         monthly_interest,
                         monthly_payments)

    print_header(alignment)

    print_amortization(table, alignment)

    puts
    puts "Press enter to continue"
    gets
  when "6"
    puts "Thanks for using the calculator!"
    break
  end
end
