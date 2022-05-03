# Get three pieces of information
#  loan amount
#  APR
#  loan duration
#
# Calculate monthly interest rate
# Calculate loan duration in months
# Calculate monthly payment

# m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

require "pry"
require "bigdecimal"

def get_monthly_payments(loan_amt, monthly_int, loan_dur)
  monthly_payment = loan_amt * (monthly_int / (1 - (1 + monthly_int)**(-loan_dur)))
end

def get_loan_amount
  puts "Please enter the loan amount in dollars"
  amount = gets.chomp.to_i
end

def get_loan_duration
  puts "Please enter the loan duration in months"
  duration = gets.chomp.to_i
end

def get_monthly_interest(loan_duration)
  puts "Next please enter the Annual Percentage Rate. Example: 10.3 for 10.3%"
  interest = BigDecimal(gets.chomp) * 0.01
  monthly_interest = interest / 12
end

puts "Welcome to the mortgage calculator!"

loan_amount = get_loan_amount
loan_duration = get_loan_duration
monthly_interest = get_monthly_interest(loan_duration)
monthly_payments = (get_monthly_payments(loan_amount, monthly_interest, loan_duration)).round(3)
total_to_pay = (loan_duration * monthly_payments).round(3)
total_interest = total_to_pay - loan_amount

puts "You will need to make #{loan_duration} payments."
puts "Each payment will be $#{monthly_payments.round(2).to_f}"
puts "Your total interest will be $#{total_interest.round(2).to_f}"






# START
#  
# PRINT Welcome and what information will be needed by the calculator
# 
# GET loan_amount (In dollars)
#   Check format
# GET annual_percentage_rate (formatted as xx.xx%)
#   Check format
# GET loan_duration (In months or years)
#   Check format
# 
# SET loan_duration_months =
#   IF months
#     loan_duration
#   IF years
#     loan_duration * 12
# 
# SET monthly_interest_rate = annual_percentage_rate / loan_duration
# 
# SET monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
# 
# PRINT monthly_payments 
# PRINT total payments
# PRINT total amount to be paid
# 
# PRINT would you like to change 1) loan amount 2) APR 3) loan_duration 4) Exit Calc
# GET change
# 
# IF change = 1
#  PRINT What is the new loan amount?
#   GET loan_amount
#   recalculate
# 
# IF change = 2
#   PRINT What is the new APR?
#   GET annual_percentage_rate
#   recalculate
# 
# IF change = 3
#   PRINT What is the duration of the loan? 
#   GET duration in months or years
#   recalculate
# 
# IF change = 4
#   PRINT Thanks for using the calculator
#   END
# 
# IF ELSE
#   PRINT Please choose 1, 2, 3 or 4
#   loop
