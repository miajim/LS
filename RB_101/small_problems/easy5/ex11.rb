# RB101-RB109 Small Problems
# Easy 5 - Problem 11: Spin Me Around In Circles
# Fri. 09/18/20

# PROBLEM STATEMENT
=begin
You are given a method named spin_me that takes a string as an argument and
returns a string that contains the same words, but with each word's characters reversed.
Given the method's implementation, will the returned string be the same object
as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

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
def spin_me(str)
  reversed_str = str.split.each do |word|
    p word.object_id
    word.reverse!
    p word.object_id
  end.join(" ")
  p reversed_str.object_id
end

hello = "hello world"
p hello.object_id
spin_me(hello) # "olleh dlrow"

# splitting the string appears to create separate new strings
# reversing the words in place is mutating, so the object ids remain the same
# joining the split strings creates another new string