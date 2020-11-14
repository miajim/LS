# RB101-RB109 Small Problems
# Medium 1 - Problem 1: Rotation (Part 1)
# Sun. 10/04/20

# PROBLEM STATEMENT
=begin
Write a method that rotates an array by moving the first element to the
end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

Further Exploration
Write a method that rotates a string instead of an array.
Do the same thing for integers. You may use rotate_array from inside your
new method.
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
  -
=end

def rotate_array(arr)
  arr[1..-1] << arr[0]
end

p self.rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# # Further Exploration
# # STRING ----------------------------------------------------------------------
# def rotate_string(str)
#   rotate_array(str)
# end

# p rotate_string("string") == "trings"
# p rotate_string("h") == "h"
# test_string = "hello there!"
# p rotate_string(test_string) == "ello there!h"
# p test_string == "hello there!"

# # INTEGER ----------------------------------------------------------------------
# # def rotate_integer(int)
# #   int_arr = int.digits.reverse
# #   rotate_array(int_arr).join.to_i
# # end

# def rotate_integer(int)
#   rotate_string(int.to_s).to_i
# end

# # def rotate_integer(int)
# #   arr = []
# #   loop do
# #     quo, rem = int.divmod(10)
# #     arr.prepend(rem)
# #     int = quo
# #     if int.to_s.length == 1
# #       arr << int unless int == 0
# #       break
# #     end
# #   end
# #   arr.join.to_i
# # end

# p rotate_integer(12345) == 23451
# p rotate_integer(6) == 6
# integer = 1_435_670
# p rotate_integer(integer) == 4356701
# p integer == 1435670

# "hi".is_a? String # => true
# "hi".is_a? Object # => true