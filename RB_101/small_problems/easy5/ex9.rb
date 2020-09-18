# RB101-RB109 Small Problems
# Easy 5 - Problem 9: ddaaiillyy ddoouubbllee
# Thurs. 09/17/20

# PROBLEM STATEMENT
=begin
Write a method that takes a string argument and returns a new string that contains
the value of the original string with all consecutive duplicate characters collapsed into a single character.
You may not use String#squeeze or String#squeeze!.

Examples:

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

Further Exploration
You may have noticed that we continue iterating until index points past the end of the string.
As a result, on the last iteration text[index] is the last character in text, while text[index + 1] is nil.
Why do we do this? What happens if we stop iterating when index is equal to text.length?

Can you determine why we didn't use String#each_char or String#chars to iterate through the string?
How would you update this method to use String#each_char or String#chars?

You can solve this problem using regular expressions (see the Regexp class documentation).
For a fun challenge, give this a try with regular expressions. If you haven't already read our book, Introduction to Regular Expressions,
you may want to keep it handy if you try this challenge.

Can you think of other solutions besides regular expressions?

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
  - create a new string to hold the output
  - walk through every character in the string
  - if the current character is equal to the previous character do nothing
  - otherwise append the current character to the output string
=end

# CODE
def crunch(str)
  crunched_str = ""
  previous_char = ""

  str.each_char do |char|
    crunched_str << char unless char == previous_char
    previous_char = char
  end

  crunched_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# Further Exploration
=begin
Using text[index + 1] which returns nil in the LS solution ensures that the last character
in the input string gets pushed to the output string.
If instead, the while loop changes to index <= text.length instead of index <= text.length - 1
A nil would be returned for both text[index] and text[index + 1], which would still work, it
would just require another (unnecessary) iteration step.

I used each_char in my solution, but it required a variable to store the previous char,
which serves a similar purpose to the index variable in the LS solution.

=end

def crunch(str)
  crunched_str = ""
  previous_char = ""

  str.each_char do |char|
    crunched_str << char unless char == previous_char
    previous_char = char
  end

  crunched_str
end
