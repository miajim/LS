# RB101-RB109 Small Problems
# Medium 2 - Problem 3: Lettercase Percentage Ratio
# Fri. 10/30/20

# PROBLEM STATEMENT
=begin

In the easy exercises, we worked on a problem where we had to count the number
of uppercase and lowercase characters, as well as characters that were neither
of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the percentage of characters in the string that are
lowercase letters, one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples

letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one string with at least one character
  Outputs
    - hash with 3 key-value pairs
Rules/Implicit Requirements
  - values in the hash should be a PERCENTAGE
  - characters can have any value
  - spaces are considered characters
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
  - create an array of alphabetical letters as constant
  - create a hash to store the key-value pairs
  - count the number of chararcters in the input string
  - iterate over the string (may convert to an array of chars first)
  - evaluate each char
    - check if the char is a-z or other
      - if the char is lowercase, increase the lowercase value in the hash
      - if the char is uppercase, incr. the uppercase value in the hash
    - otherwise the char is neither, incr. the neither value in the hash
      - could also wait once iteration is complete to find the difference
        of 100% - %lowercase - %uppercase = %neither
  - return the hash
=end
require 'pry'

ALPHABET = ("a".."z").to_a


# def letter_percentages(str)
#   total_chars = str.size.to_f

#   str.chars.each_with_object(Hash.new(0)) do |char, hsh|
#     if ALPHABET.include?(char.downcase)
#       if char == char.downcase
#         hsh[:lowercase] += (1 / total_chars) * 100
#         # binding.pry
#       else
#         hsh[:uppercase] += (1 / total_chars) * 100
#       end
#     else
#       hsh[:neither] += (1 / total_chars) * 100
#     end
#   end
# end

# Note that since my solution uses #each_with_object, the last hash will not contain
  # values for lowercase and uppercase in the last example, since they were never
  # executed.
# p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
# p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }

# Further Exploration

def letter_percentages(str)
  total_chars = str.size.to_f

  str.chars.each_with_object(Hash.new(0)) do |char, hsh|
    if ALPHABET.include?(char.downcase)
      if char == char.downcase
        hsh[:lowercase] += (1 / total_chars) * 100
        # binding.pry
      else
        hsh[:uppercase] += (1 / total_chars) * 100
      end
    else
      hsh[:neither] += (1 / total_chars) * 100
    end
  end.transform_values { |v| v.ceil(1) }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
