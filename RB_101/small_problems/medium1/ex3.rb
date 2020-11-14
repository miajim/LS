# RB101-RB109 Small Problems
# Medium 1 - Problem 3: Rotation (Part 3)
# Wed. 10/07/20

# PROBLEM STATEMENT
=begin
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175.
Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed
in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and
rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation
of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Further Exploration
Assume you do not have the rotate_rightmost_digits or rotate_array methods.
How would you approach this problem? Would your solution look different? Does
this 3 part approach make the problem easier to understand or harder?

There is an edge case in our problem when the number passed in as the argument
has multiple consecutive zeros. Can you create a solution that preserves zeros?
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    -
  Outputs
    -
Rules/Implicit Requirements
  -
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


=begin
735291

1st: 352917
2nd: 329175
3rd: 321759
4th: 321597
5th: 321579

ALGO
- obtain the individual digits of the input integer
- rotate using the mental model of the rotate_array method
- rotate again n-1 times (where n is the length of the integer) using the mental
  model of the rotate_rightmost_digits method
- return the final rotated integer after n-1 iterations

=end

def max_rotation(int)
  digits_arr = rotate_array(int.to_s.chars)
  rotated_int = digits_arr.join.to_i

  n = digits_arr.length - 1
  while n > 1
    rotated_int = rotate_rightmost_digits(rotated_int, n)
    n -= 1
  end

  rotated_int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

=begin
# Further Exploration
I solved Parts 1 and 3 a lot faster than part 2; the helper method in part 2
is very helpful in breaking down this problem into understandable chunks.
=end

# Edge case - Create a solution that preserves zeroes

# p max_rotation(300_000_000)