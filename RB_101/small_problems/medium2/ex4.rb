# RB101-RB109 Small Problems
# Medium 2 - Problem 4: Matching Parentheses?
# Fri. 10/30/20

# PROBLEM STATEMENT
=begin
Write a method that takes a string as argument, and returns true if all
parentheses in the string are properly balanced, false otherwise.
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Examples

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

Note that balanced pairs must each start with a (, not a ).

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one string, any chars (may or may not include paren)
  Outputs
    - boolean (T/F)
Rules/Implicit Requirements
  - parenthesis must be balanced
    - must have matching pairs of "(" and ")"
    - cannot start with a ")", even if you have a "(" later on (ex. 7)
  - no paren ==> balanced
  - implicit rule: must have an equal number of "(" and ")" to even be considered
    for balanced
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
  - keep track of "balance" as we iterate over the input string
    - balance starts at 0
    - "(" ==> balance += 1
    - ")" ==> balance += -1
  - check balance at the end of iteration
  - if balance is 0 return true otherwise return false

  Situations that are accounted for using balance variable:
  - can also immediately check whether there are parentheses or not (if count
    for both types are 0, then return true)
  - check whether the number of "(" and ")" are equal. If they are not, can
    immediately return false
  Situations that are unaccounted for using the balance variable:
  - if the first parenthesis we encounter when the balance equals 0 is ")" =>
    we must return false

=end

def balanced?(str)
  balance = 0
  str.each_char do |char|
    return false if balance == 0 && char == ")"
    if char == "("
      balance += 1
    elsif char == ")"
      balance -= 1
    end
  end
  balance == 0
end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

# Further Exploration
def further_balanced?(str, punctuation)
  balance = 0
  str.each_char do |char|
    return false if balance == 0 && char == punctuation[1]
    if char == punctuation[0]
      balance += 1
    elsif char == punctuation[1]
      balance -= 1
    end
  end
  balance == 0
end

p further_balanced?('What {is} this?{', "{}") == false
p further_balanced?("This is a nested array: [[1, 2], [2, 3]].", "[]") == true
p further_balanced?("It's 'technically' balanced.", "''") == false