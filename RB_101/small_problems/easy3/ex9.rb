# RB101-RB109 Small Problems
# Easy 3 - Problem 9: Palindromic Strings (Part 2)
# Wed. 09/09/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Write another method that returns true if the string passed as an argument is
a palindrome, false otherwise.
This time, however, your method should be case-insensitive,
and it should ignore all non-alphanumeric characters.
If you wish, you may simplify things by calling the palindrome? method you
wrote in the previous exercise.

Examples:

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

Further Exploration
Read the documentation for String#delete, and the closely related String#count
(you need to read count to get all of the information you need for delete.)

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
def palindrome?(str)
  str == str.reverse
end


def real_palindrome?(input)
  palindrome?(input.downcase().gsub(/\W/, ""))
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
Solution almost identical, uses String#delete instead of #gsub

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
String#delete: returns a copy of str with all characters in the intersection
of its arguments deleted. Uses the same rules for building the set of characters
as String#count

String#count: Each other_str parameter defines a set of characters to count.
The intersection of these sets defines the characters to count in str. Any
other_str that starts with a caret ^ is negated. The sequence c1-c2 means all
characters between c1 and c2. The backslash character \ can be used to escape ^
or - and is otherwise ignored unless it appears at the end of a sequence or
the end of a other_str.

=end