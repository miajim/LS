=begin
Mon. 11/2/20

Write a function, persistence, that takes in a positive parameter num and
returns its multiplicative persistence, which is the number of times you must
multiply the digits in num until you reach a single digit.

For example:

 persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number


 # Notes
Inputs
  - one positive integer ( >= 0 )
Outputs
  - one positive integer (>=0), which represents the number of times it takes
    to generate a single digit number from the result of multiplying the digits
    in the initial number (and potentially subsequent numbers)
Rules/Req's
  - input and output are both positive integers
  -
  -
Questions
  -
  -
Algorithm
  - initialize a count variable that keeps track of the # of iterations
  - set a variable to the current number (starting w/ the input number)
  - start a loop that only breaks when the result of the multiplication of digits is 1 in length
  - take the current number, find its digits, and multiply the digits
  - if this value (result of the *) has a length of 1, return the # stored in count
  - otherwise increment the count variable and continue looping
=end

def persistence(num)
  count = 0
  current_num = num

  loop do
    return count if current_num.to_s.size == 1
    current_num = current_num.digits.reduce(:*)
    count += 1
  end

end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
