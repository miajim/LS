# RB101-RB109 Small Problems
# Easy 3 - Problem 8: Palindromic Strings (Part 1)
# Wed. 09/09/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Write a method that returns true if the string passed as an argument is a
palindrome, false otherwise. A palindrome reads the same forward and backward.
For this exercise, case matters as does punctuation and spaces.

Examples:

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

Further Exploration
Write a method that determines whether an array is palindromic;
that is, the element values appear in the same sequence both forwards and
backwards in the array. Now write a method that determines whether an array or
a string is palindromic; that is, write a method that can take either an array
or a string argument, and determines whether that argument is a palindrome.
You may not use an if, unless, or case statement or modifier.

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
def palindrome?(str)
  str == str.reverse
end


# Further Exploration
# array input only
def palindrome?(arr)
  arr_to_s = arr.map(&:to_s).join()
  arr_to_s == arr_to_s.reverse
end

# array or string input (the reverse method works the same way for strings
# and arrays)
def palindrome?(input)
  input == input.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true


p palindrome?('madam'.chars) == true
p palindrome?('Madam'.chars) == false          # (case matters)
p palindrome?("madam i'm adam".chars) == false # (all characters matter)
p palindrome?('356653'.chars) == true
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
