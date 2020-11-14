=begin
Mon. 11/2/20

Write Number in Expanded Form
You will be given a number and you will need to return it as a string in Expanded Form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.

If you liked this kata, check out part 2!!

# Notes
Inputs
  - an integer > 0
Outputs
  - a string representing the integer in expanded form
Rules/Req's
  - can "ignore" places with "0"
  - must return a string
  -
Questions
  -
  -
Algorithm
  - find the digits of the input integer, store in an array
    - the digits should be in place order from lowest to highest
    - i.e., ones place, tens place, hundreds place, etc.
  - iterate over the array of digits, using the index as the power of 10 of the
    current digit
    - each digit corresponds to the digit * 10^index
    - convert this calculated value to a string
    - if the digit is 0, you can ignore the digit (return an empty string)
    - remove the empty strings
    - reverse the array
  - join the array of strings with " + " and return the joined string
=end

# def expanded_form(int)
#   exp_arr = []
#   int.digits.each_with_index do |digit, i|
#     exp_arr << (digit * (10 ** i)).to_s unless digit == 0
#   end
#   exp_arr.reverse.join(" + ")
# end

# Refactored
def expanded_form(int)
  int.digits.map.with_index { |digit, i| digit * (10 ** i)}.reject(&:zero?).reverse.join(" + ")
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'

