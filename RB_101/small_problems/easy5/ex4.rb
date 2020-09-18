# RB101-RB109 Small Problems
# Easy 5 - Problem 4: Letter Swap
# Wed. 09/16/20

# PROBLEM STATEMENT
=begin
Given a string of words separated by spaces, write a method that takes this string
of words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string
will always contain at least one word. You may also assume that each string contains nothing but words and spaces.

Examples:

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

Further Exploration
How come our solution passes word into the swap_first_last_characters method invocation instead of just passing the characters that needed to be swapped? Suppose we had this implementation:

def swap_first_last_characters(a, b)
  a, b = b, a
end
and called the method like this:

swap_first_last_characters(word[0], word[-1])
Would this method work? Why or why not?
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
Outputs
Rules/Implicit Requirements
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM
# split the string by spaces
# for each element (i.e., word) in the array, save the current first and last letters in variables and then reassign them
# join the elements in the array to form the new string with reversed words

=end

# CODE

def swap(str)
  new_str_ary = str.split.map do |word|
    first = word[0] # or word.chars.first
    last = word[word.size - 1] #or word.chars.last
    word[0] = last
    word[word.size - 1] = first
    word
  end
  new_str_ary.join(" ")
end

p swap('Oh what a wonderful day it is')  == 'hO thaw a londerfuw yad ti si'
p swap('Abcde')  == 'ebcdA'
p swap('a') == 'a'

# Further exploration
# This would not have worked, because swap_first_last_characters would not be returning the correct value to the swap method
# While it does re-assign the objects within the word string, the value returned to map would be the value a, b was assigned to
# In this case it would be the array [b, a], which would then be returned by map
# This array is then joined to form the return value of #swap, which would be "ba"