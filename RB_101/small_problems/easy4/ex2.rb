# RB101-RB109 Small Problems
# Easy 4 - Problem 2: What Century is That?
# Fri. 09/11/20

# PROBLEM STATEMENT
=begin
Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century number,
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01.
So, the years 1901-2000 comprise the 20th century.

Examples:

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
  - number (year)
Outputs
  - string (century with ending)

Rules/Implicit Requirements
- Century range (e.g., 1901-2000)
- Century endings
  - th: 0, 4, 5, 6, 7, 8, 9, 11, 12, 13
  - st: 1
  - nd: 2
  - rd: 3
- Century = every 100 years
- Divide input by 100 to determine century
- Determine float, round float to the neareast integer
- e.g., 1901/100 = 19.01 --> 20, 1949/100 = 19.49 --> 20, 2000/10 = 20 --> 20
- Float#ceil accomplishees this



Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
  - integer

  Rules
  - divide by 100.00 (float) to return a float
  - based on the ending of the century number, pick a string ending
  - use a hash to store the century endings, numbers in an array as the values
    and endings as keys

ALGORITHM
  - Divide the input year by 100.0
  - Determine the ceiling of this result
  - Find the last digit of the result and use that to determine the ending
  - Turn the result into a string and append the string ending

=end

# CODE

def ending(last_num)
  endings = {
    "th" => [0, 4, 5, 6, 7, 8, 9, 11, 12, 13],
    "st" => [1],
    "nd" => [2],
    "rd" => [3]
  }

  suffix = ""
  endings.each do |key, value|
    if value.include?(last_num)
      suffix = key
    end
  end
  suffix
end

def last_digits(num)
  digits = num.digits
  if ((1..3).include?(digits[0])) && (digits[1] == 1)
    last_digit = digits[1]*10 + digits[0]
  else
    last_digit = digits.first
  end
  last_digit
end


def century(year)
  century_num = (year/100.0).ceil
  suffix = ending(last_digits(century_num))
  century_num.to_s + suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# See LS Solution, similar but a lot cleaner

# I really like Karis Tobias' solution; clean and easy to follow.
def century(year)
  cent = (year.to_f / 100).ceil.to_s

  if cent.end_with?("1") && !(cent.end_with?("11"))
    cent << "st"
  elsif cent.end_with?("2") && !(cent.end_with?("12"))
    cent << "nd"
  elsif cent.end_with?("3") && !(cent.end_with?("13"))
    cent << "rd"
  else
    cent << "th"
  end
end