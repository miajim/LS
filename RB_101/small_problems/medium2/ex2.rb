# RB101-RB109 Small Problems
# Medium 2 - Problem 2 : Now I Know My ABCs
# Thurs. 10/29/20

# PROBLEM STATEMENT
=begin
A collection of spelling available_blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use
both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled
from this set of blocks, false otherwise.

EXAMPLES:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one string, no special characters or spaces
  Outputs
    - boolean (T/F)
Rules/Implicit Requirements
  - we must be able to spell / recreate the input string using each block
    only once, where a block is the pair of letters (one or the other)
  - case-insensitive
  - the collection of blocks can be represented as pairs in a subarray within
    a larger array that contains the pairs
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
  - create a nested array of the blocks, where each block is a two element subarray
  - convert the string to uppercase
  - iterate through the string (chars)
  - if the char is present in any of the subarrays, delete the subarray
      - for a given char, iterate through the blocks array to determine if
      the char is present in the subarray. store the index of the block
      - after iterating over the block, delete the element at the given index
  - if the subarray cannot be deleted, return false
  - if all the subarrays can be deleted, then return true
=end

# Initial Solution
# def block_word?(str)
#   available_blocks = [["B", "O"], ["G", "T"], ["V", "I"], ["X", "K"], ["R", "E"], ["L", "Y"],
#           ["D", "Q"], ["F", "S"], ["Z", "M"], ["C", "P"], ["J", "W"], ["N", "A"], ["H", "U"]]

#   str.upcase.each_char do |char|
#     index = nil
#     available_blocks.each_with_index { |block, i| index = i if block.include?(char) }
#     return false if index == nil
#     available_blocks.delete_at(index)
#   end
#   true
# end

# Alternative Algorithm and Solution
=begin
- given a nested array constant representing the blocks
- iterate over the nested array (subarray i.e., single block)
- if the input word contains both letters in the subarray OR contains more than one of either letter
  - return false
  - otherwise, continue iterating over the subarrays
- return true after iteration
=end

BLOCKS = [["B", "O"], ["G", "T"], ["V", "I"], ["X", "K"], ["R", "E"], ["L", "Y"],
          ["D", "Q"], ["F", "S"], ["Z", "M"], ["C", "P"], ["J", "W"], ["N", "A"], ["H", "U"]]

def block_word?(str)
  str.upcase!
  BLOCKS.each do |block|
    first, last = block
    condition1 = str.include?(first) && str.include?(last)
    condition2 = str.count(first) >= 2 || str.count(last) >= 2
    return false if condition1 || condition2
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true