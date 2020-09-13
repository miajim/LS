# RB101-RB109 Lesson 4
# Intro to PEDAC - Data Structure/Algorithm Example Problem
# Tues. 09/08/20

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
# Understand the Problem
  # Clarifying Questions
  1) What should be returned if no palindromes are found? --> Ex. 3
  2) What should be returned if an empty string is input? --> Ex. 4
  3) Can strings be more than one word? If so, are spaces considered in the
     palindrome or are words treated separately/individually? If words are considered
     individually, are palindromes within words considered, even if they aren't
     actually words? --> per examples, looks like input string is only one word,
     or at least contains no spaces, even groups of characters that aren't words
     can be considered
  4) Can I assume that all inputs as strings? --> all examples
  5) If the same sequence of characters is a palindrome and is repeated more than once,
  should it be included in the output? Or should the output only include unique
  instances of palindromes?

  Input: string (no spaces, can be combination of uppercase and lowercase)
  Output: array (either empty if no palindromes are found or if the string is empty
  or with string objects of the palindromes)

  Rules:
    Explicit Requirements:
    - Palindromes are case-sensitive (e.g., "Dad" is not a palindrome, but
    "dad" is)
    - All palindromes within the string must be retured as individual strings,
    each separate elements in an array
    - If there are no palindromes within the string or the string is empty,
    an empty array should be returned.

    Implicit Requirements:
    - The returned strings aren't the same string object.
    - A palindrome is at least 2 characters in length.
    - Only letters (no numbers) will be considered.
    - A palindrome can occur anywhere in the string (i.e., the string should be
    checked at all positions for a palindrome, not just starting at the first
    character.)

# Data Structure
  - input: string
  - output: 1D array of string objects as elements

# Algorithm
  - Check that the input string is not empty (if empty, return an empty array)
  - Define a new empty array to store the palindromes
  - Take the input string and start with the first two characters
    - Check to see if those two characters are a palindrome
    - If they are, add them to the output array
    - If they aren't continue iterating through the input string by adding the
    next character to the end of the string and repeat the palindrome check, etc.
  - Return the output array (if it's empty, that means no palindromes were found).
  No "extra" condition is needed for checking if there were or were not palindromes.

=end

# Code
# def is_a_palindrome?(string)
#   string == string.reverse
# end

# def palindrome_substrings(input)
#   start_i = 0
#   output = []

#   return [] if input.empty?
#   while start_i < (input.length - 1)
#     end_i = start_i + 1
#     while end_i < input.length
#       substring = input[start_i..end_i]
#       (output << substring ) if is_a_palindrome?(substring)
#       end_i += 1
#     end
#     start_i += 1
#   end
#   return output
# end

# p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# p palindrome_substrings("palindrome") == []
# p palindrome_substrings("") == []


# Wrote a substrings method based on LS informal pseudocode (slightly different,
# in that my method does the equivalent of Array#shift, but on the input string)
def substrings(str_input)
  arr_substrings = []
  loop do
    index = 1
    while index < str_input.length
      arr_substrings << str_input[0..index]
      index += 1
    end
    str_input = str_input.delete_prefix(str_input[0])
    break if (str_input.length == 1)
  end
  arr_substrings
end

# test substrings method
# input = "halo"
# p substrings(input)
# p input

def is_a_palindrome?(string)
  string == string.reverse
end

# refactored palindrome_substrings method
def palindrome_substrings(input)
  output = []
  return [] if input.empty? # I need this here to catch an empty string,
  # note that LS solution doesn't need this because of the way their substrings
  # method is defined.
  arr_substrings = substrings(input)
  arr_substrings.each { |substr| output << substr if is_a_palindrome?(substr) }
  return output
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []

# Takeaways: write pseudocode (doesn't have to be formalized) before coding,
# main code should be at a high level of abstraction, write sub-methods to tackle
# specific tasks, perform incremental testing as you write the code