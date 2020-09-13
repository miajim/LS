# RB101-RB109 Small Problems
# Easy 3 - Problem 10: Palindromic Numbers
# Wed. 09/09/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

Examples:

palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true

Further Exploration
Suppose your number begins with one or more 0s. Will your method still work?
Why or why not? Is there any way to address this?

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
def palindrome?(str)
  str == str.reverse
end


def palindromic_number?(num)
  palindrome?(num.to_s)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Further exploration
# One or more leading zeros converted into a string does not produce correct
# result. There doesn't appear to be a way to determine if a number with leading
# zeros is a palindrome. Using #to_s and a given base doesn't seem to work either,
# unless the number is octal, but then the digits in each place (ones, tens,
# hundreds, etc.) would have to be within the 0-7 range in order to be correctly
# represented by
# The best way to solve this would be to install a check to determine if the
# number converted to a string and then back to an integer is equal to the
# original input, and if not, then ask the user to input a valid input.

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

=end