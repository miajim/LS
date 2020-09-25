# RB101-RB109 Small Problems
# Easy 7 - Problem 2: Lettercase Counter
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the number of characters in the string that are
lowercase letters, one the number of characters that are uppercase letters,
and one the number of characters that are neither.

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
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
LOWERCASE = ("a".."z").to_a
UPPERCASE = ("A".."Z").to_a

def letter_case_count(str)
  case_count = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |char|
    if LOWERCASE.include?(char) # could also use regexp (char =~ /[a-z]/ )
      case_count[:lowercase] += 1
    elsif UPPERCASE.include?(char) # (char =~ /[A-Z]/ )
      case_count[:uppercase] += 1
    else # (char =~ /[^a-zA-Z]/ )
      case_count[:neither] += 1
    end
  end
  case_count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# LS Solution 1 is identical, Solution 2 uses regexp and Array#count