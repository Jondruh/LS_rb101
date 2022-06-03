require "bigdecimal"

def get_mthly_pymnts(loan_amt, mthly_int, loan_dur)
  loan_amt * (mthly_int / (1 - (1 + mthly_int)**(-loan_dur)))
end

def get_loan_amt
  puts "Please enter the loan amount in dollars"
  gets.chomp.to_i
end

def get_loan_dur
  puts "Please enter the loan duration in months"
  gets.chomp.to_i
end

def get_int_rate
  puts "Please enter the Annual Percentage Rate. Example: 10.3 for 10.3%"
  BigDecimal(gets.chomp)
end

def get_amt_dur_rate
  loan = get_loan_amt
  dur = get_loan_dur
  rate = get_int_rate

  return loan, dur, rate
end

def calc(loan_amt, loan_dur, int_rate)
  mthly_int = (int_rate * 0.01) / 12
  mthly_pymnts = (get_mthly_pymnts(loan_amt, mthly_int, loan_dur))
  ttl_to_pay = (loan_dur * mthly_pymnts)
  ttl_int = ttl_to_pay - loan_amt

  return mthly_int, mthly_pymnts, ttl_to_pay, ttl_int
end

def amortization(loan_amt, loan_dur, mthly_int, mthly_pymnts)
  table = { balance: [], int: [], principal: [], ending_bal: [] }
  month = 0
  int = (loan_amt * mthly_int)

  loan_dur.times do
    table[:balance][month] = loan_amt
    table[:int][month] = int
    table[:principal][month] = (mthly_pymnts - int)
    table[:ending_bal][month] = (loan_amt - (mthly_pymnts - int))

    int = table[:ending_bal][month] * mthly_int
    loan_amt = table[:ending_bal][month]

    month += 1
  end
  table
end

def print_header(alignment)
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

def print_amortization(table, alignment)
  month = 0

  table[:balance].length.times do
    counter = 0
    row = []
    string_row = " " * 60

    table.each { |entry| row.push(entry[1][month]) }

    row.each do |entry|
      string_row.insert(alignment.fetch(counter), entry.round(2).to_f.to_s)
      counter += 1
    end

    month += 1

    puts string_row.rstrip
  end
end

puts "Welcome to the mortgage calculator!"

loan_amt, loan_dur, int_rate = get_amt_dur_rate

loop do # Main loop
  mthly_int, mthly_pymnts, ttl_to_pay, ttl_int = calc(loan_amt,
                                                      loan_dur,
                                                      int_rate)

  puts %{

    Loan amount   > $#{loan_amt}
    Interest Rate > #{(int_rate).round(2).to_f}%
    Loan Duration > #{loan_dur} months

    You will make #{loan_dur} payments of > $#{mthly_pymnts.round(2).to_f}

    All together you will pay > $#{ttl_to_pay.round(2).to_f}

    Your total interest payed will be > $#{ttl_int.round(2).to_f}

    Options:
      1) Change Loan amount
      2) Change loan duration
      3) Change interest rate
      4) Restart the calculator
      5) Calculate amortization table
      6) Exit the Calculator

    }

  option_select = gets.chomp

  case option_select
  when "1"
    loan_amt = get_loan_amt
  when "2"
    loan_dur = get_loan_dur
  when "3"
    int_rate = get_int_rate
  when "4"
    loan_amt, loan_dur, int_rate = get_amt_dur_rate
  when "5"
    alignment = [0, 20, 40, 60]
    table = amortization(loan_amt, loan_dur, mthly_int, mthly_pymnts)

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
