# RB101-RB109 Small Problems
# Easy 8 - Problem 5: Palindromic Substrings
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that returns a list of all substrings of a string that are
palindromic. That is, each substring must consist of the same sequence of
characters forwards as it does backwards. The return value should be arranged
in the same sequence as the substrings appear in the string. Duplicate
palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay
attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
"Abc-bA" are. In addition, assume that single characters are not palindromes.

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

Further Exploration
Can you modify this method (and/or its predecessors) to ignore non-alphanumeric
characters and case? Alphanumeric characters are alphabetic characters(upper and
lowercase) and digits.
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

# CODE
def leading_substrings(str)
  i = 0
  arr = []
  while i < str.length
    arr << str[0..i]
    i += 1
  end
  arr
end

def substrings(str)
  arr = []
  0.upto(str.length-1) do |i|
    arr += leading_substrings(str[i..-1])
  end
  arr
end

def is_a_palindrome?(str)
  (str == str.reverse) && (str.length > 1)
end

def palindromes(str)
  palindromes = []
  substrings(str).each do |substr|
    palindromes << substr if (is_a_palindrome?(substr))
  end
  palindromes
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]

p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration
# ignores string case and non-alphanumeric characters when checking for palindrome
# but returns the original string if it is a palindrome (i.e., not ignoring case/non-alphanumeric)
def leading_substrings(str)
  i = 0
  arr = []
  while i < str.length
    arr << str[0..i]
    i += 1
  end
  arr
end

def substrings(str)
  arr = []
  0.upto(str.length-1) do |i|
    arr += leading_substrings(str[i..-1])
  end
  arr
end

def is_a_palindrome?(str)
  temp_str = str.gsub(/\W/, "")
  (temp_str == temp_str.reverse) && (temp_str.length > 1)
end

def palindromes(str)
  palindromes = []
  substrings(str).each do |substr|
    palindromes << substr if (is_a_palindrome?(substr.downcase))
  end
  palindromes
end

p palindromes("Abc-ba") == ["Abc-ba", "bc-b"]