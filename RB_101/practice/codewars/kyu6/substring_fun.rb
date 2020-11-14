=begin
Codewars - Substring Fun (6 kyu)
Suggested on Christian Larwood's Study Guide
Mon. 10/26/20

Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word
which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2

# Notes
Inputs
  - one array with string objects
Outputs
  - one string object
Rules/Req's
  - concatenate the nth letter from each word to form a new string
  - n is the position of the word in the list
  - Based on the test cases, I'm going to assume that all words are long enough
    to provide the nth character of the word to form the new string
Questions
  - Looks like case should be maintained
  - Looks like characters can be non-alphabetical and should be maintained
Algorithm
  - create a variable to store the output string
  - iterate through the input array keeping track of the current index
  - append the current index of the current word (e.g., word[i] ) to an output string
  - return the new string upon stopping iteration
=end

# def nth_char(arr)
#   str = ""
#   arr.each_with_index { |word, i| str << word[i] }
#   str
# end

# Refactored solution

def nth_char(arr)
  arr.map.with_index { |word, i| word[i] }.join
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'
