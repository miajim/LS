# RB101-RB109 Small Problems
# Medium 2 - Problem 7: Unlucky Days
# Fri. 10/30/20

# PROBLEM STATEMENT
=begin
Write a method that returns the number of Friday the 13ths in the year given by
an argument. You may assume that the year is greater than 1752 (when the United
Kingdom adopted the modern Gregorian Calendar) and that it will remain in use
for the foreseeable future.

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one integer, representing a calendar year > 1752
  Outputs
    - one integer, representing the number of friday the 13ths
Rules/Implicit Requirements
  - using the Gregorian calendar (leap years), input year will be > 1752
  - leap year: year must be evenly divisible by 4, if the year can also be
    evenly divided by 100 it is not a leap year UNLESS the year is also
    evenly divided by 400 (then it is a leap year)
  -
Clarifying Questions
  -
Mental Model (optional)
  - January 1st, 1753 ==> Monday
  - 7 days in the week (Mon - Sun.)
  - leap year: 366 days
  - every other year: 365 days
  - if Monday is Jan. 1st, Jan. 13th is Monday - 2 days  = Saturday
  - if Jan. 1st is Sun., Jan. 13th is Friday
    - && non-leap year:
      - number of days to the next 13th = (31 - 13) + 13 = 31
      - i.e., number of days to the next 13th = number of days in the current mo.
      - if num. of days to the next 13th % 7 == 0, then it is Friday the 13th
  - && leap-year:
      (similar algorithm to with leap-year)

  - Jan: 31
  - Feb: 28, 29 on leap years
  - Mar: 31
  - Apr: 30
  - May: 31
  - June: 30
  - July: 31
  - August: 31
  - Sept: 30
  - Oct: 31
  - Nov: 30
  - Dec: 31

  jan, mar, may, july, aug, oct, dec => 31
  0, 2, 4, 6, 7, 9, 11
  apr, jun, sept, nov => 30
  3, 5, 8, 10
  feb => 28, 29 on leap years
  1

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    -
  Rules
    -

ALGORITHM
  - determine if the input year is a leap year
  - determine the number of years between the input year and 1753
  - determine the number of leap years between the input year and 1753
    - this affects the day of the week (+2 instead of +1)
  - calculate the number of days between 1/1/1753 and 1/1/input year
    - total days =  # of leap years * 366 + (total # of yrs - # of leap years) * 365
  - determine the day of week of january 1st for the input year
      - (total days) % 7 ==> day of the week
      - where Monday => 0, Tuesday => 1, etc.
  - depending on the number of days in the month and starting day of the month
    determines whether the 13th lands on a Friday
  - add (31 % 7 => 3) to the day of the week for jan. 1st
    - if the day of the week is 4 (Friday), then add 1 to # of friday the 13ths
    - otherwise go to the next month (add n days from previous month % 7 ) to the
      current total
        - add 28 days if the input year is not a leap year, 29 days if it is
        - if the current total exceeds 7, need to do num % 7
=end

def leap_year?(year)
  if (year % 4) == 0
    if (year % 100) == 0
      if (year % 400) == 0
        true
      else
        false
      end
    else
      true
    end
  else
    false
  end
end

YEAR1 = 1753
DAYS_LEAP_YEAR = 366
DAYS_NORM_YEAR = 365
MONTHS_31_DAYS = [0, 2, 4, 6, 7, 9] # excluded month 11 (Dec.), no need to count based on the way the algorithm works
MONTHS_30_DAYS = [3, 5, 8, 10]

def friday_13th(year)
  leap_years, norm_years = (YEAR1...year).partition { |curr_year| leap_year?(curr_year) }
  num_leap_years = leap_years.size
  num_norm_years = norm_years.size
  total_days = DAYS_LEAP_YEAR * num_leap_years + DAYS_NORM_YEAR * num_norm_years

  first_13th_of_month = (total_days % 7 - 1  + 13 ) # Jan. 13th of input year

  num_friday_13th = 0
  12.times do |month|
    (first_13th_of_month %= 7) unless first_13th_of_month <= 7
    num_friday_13th += 1 if first_13th_of_month == 4

    if MONTHS_31_DAYS.include?(month)
      first_13th_of_month += 31
    elsif MONTHS_30_DAYS.include?(month)
      first_13th_of_month += 30
    elsif month == 1
      first_13th_of_month += leap_year?(year) ? 29 : 28
    end
  end
  num_friday_13th
end

p friday_13th(2015) == 3
p friday_13th(1757) == 1
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# LS Solution
require 'date'
def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

=begin
Note that the date class is part of the standard library, not the core library,
so it must be "imported" using => require 'date'
Date::civil appears to be an alias to Date:new or Date:start (see docs)
=end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

