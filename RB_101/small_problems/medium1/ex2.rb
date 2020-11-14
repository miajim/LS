# RB101-RB109 Small Problems
# Medium 1 - Problem 2: Rotation (Part 2)
# Wed. 10/07/20

# PROBLEM STATEMENT
=begin
Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want.
(Recommended!)

You may assume that n is always a positive integer.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - two inputs: integer, integer
  Outputs
    - one output: new integer
Rules/Implicit Requirements
  - returning a new integer
  - input integer n (second argument), 1..length of integer that we want to rotate
  -
Clarifying Questions
  -
Mental Model (optional)
  -

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    -
  Rules
    -

ALGORITHM
  - find the digits of the number to rotate
  - locate the rightmost digit counting from the last integer (n digits from the last integer)
  - remove that digit from it's current location and append it to the end of the modified integer
  - return that modified integer
=end

def rotate_array(arr)
  arr[1..-1] << arr[0]
end

# without the rotate_array method from part 1

# def rotate_rightmost_digits(int, n)
#   digit_arr = int.digits.reverse # ==> [7, 3, 5, 2, 9, 1]
#   rotate_digit = digit_arr.delete_at(-n)
#   digit_arr << rotate_digit
#   digit_arr.map(&:to_s).join.to_i
# end

# with the rotate_array method from part 1

def rotate_rightmost_digits(int, n)
  digit_arr = int.digits.reverse
  rotated_portion = rotate_array(digit_arr[-n..-1])
  rotated_arr = digit_arr[0...-n] + rotated_portion
  rotated_arr.map(&:to_s).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
