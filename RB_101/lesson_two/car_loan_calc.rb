# RB101-RB109 Lesson 2: Small Problems
# Assignment: Mortgage/Car Loan Calculator
# Fri. 08/28/20

# Inputs:
# Loan amount - must be > 0, at least one digit, zero to infinite numbers
#   before decimal, may or may not have a decimal, zero to infinite numbers
#   after decimal
# APR - must be > 0, at least one digit, zero to infinite numbers
#   before decimal, may or may not have a decimal, zero to infinite numbers
#   after decimal
# Loan duration - must be a positive integer, at least one digit

# Outputs (to calculate):
# Monthly interest rate
# Loan duration (months)
# Monthly payment

# Formula: m = p * (j/ (1-(1+j)**(-n)))
# Where:
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration (months)

# Definitions---------------------------------------------------------------
# Check valid float (or integer)
def valid_num?(num)
  # Use Regexp to check that the loan amount and APR inputs are valid
  num.match(/\d/) && num.match?(/^\d*\.?\d*$/)
end

# Check valid int > 0
def valid_int?(num)
  # Use Regexp to check that the loan duration input is valid
  num.match?(/^\d+$/)
end

# Invalid message string
invalid_message = "That's not a valid number - try again."

# Main Program---------------------------------------------------------------
# Welcome user and ask for inputs
loop do # Outermost loop
  puts "Hello and welcome to the loan calculator!"

  # Loan amount
  loan_amount = ''
  loop do
    print "What amount would you like to loan?: $"
    loan_amount = Kernel.gets().chomp()
    # Check valid input
    valid_num?(loan_amount) ? (break) : (puts invalid_message)
  end

  # Loan term
  loan_duration_years = ''
  loop do
    puts "What is the loan term in years and months?"
    print "Input years: "
    loan_duration_years = Kernel.gets().chomp()
    # Check valid input
    valid_int?(loan_duration_years) ? (break) : (puts invalid_message)
  end

  loan_duration_months = ''
  loop do
    print "Input months: "
    loan_duration_months = Kernel.gets().chomp()
    # Check valid input
    valid_int?(loan_duration_months) ? (break) : (puts invalid_message)
  end

  # APR
  apr = ''
  loop do
    print "What is the monthly APR? Input as a %, not a decimal. "
    apr = Kernel.gets().chomp()
    # check valid input
    valid_num?(apr) ? (break) : (puts invalid_message)
  end

  # Sleep timer
  puts "Calculating monthly payment..."
  Kernel.sleep(1.0)

  # Calculate monthly interest rate
  loan_duration = loan_duration_years.to_i() * 12 + loan_duration_months.to_i()
  monthly_interest_rate = apr.to_f() / 12
  monthly_payment = loan_amount.to_f() * (monthly_interest_rate / (1 - (1 +
  monthly_interest_rate)**(-loan_duration)))

  # Output to user
  puts "At a monthly interest rate of #{(monthly_interest_rate).truncate(2)}%
  over #{loan_duration} months, the monthly required payment is
  $#{monthly_payment.truncate(2)}."

  # Ask to perform calculation again
  puts "Would you like to perform another loan calculation? Yes or no?: "
  perform_calc = Kernel.gets().chomp()
  break unless perform_calc.match(/^y/i)
end
# Let the user know that they exited the program
puts "Thank you for using the Car Loan Calculator. Goodbye!"
