=begin
=begin
Sun. 11/1/20
From RB109 Part 2 Study Guide:

Write a method to determine if a word is a palindrome, without using the reverse
method.

# Notes
Inputs
  - string (one word, assume no spaces)
Outputs
  - boolean (T/F)
Rules/Req's
  - do not use the reverse method
  - assuming the string will only contain one word (no spaces, no special chars)
  - assuming whether or not the word is palindrome is case-insensitive
Questions
  -
  -
Algorithm
  - downcase the input string
  - iterate over half of the word
  - compare the first index (0) to the last index (-1)
            the second index (1) to the penultimate index (-2)
  - if all the index comparisons return true, the the word is a palindrome (return true)
    otherwise it is not (return false)

=end

# Option 1
def palindrome?(word)
  word.downcase!
  (0...(word.size / 2)).each do |i|
    return false if word[i] != word[-(i + 1)]
  end
  return true
end

# Option 2
def palindrome?(word)
  word.downcase!
  (0...(word.size / 2)).all? { |i| word[i] == word[-(i + 1)] }
end

p palindrome?("hello") == false
p palindrome?("aSdsA") == true

# Slightly harder (include spaces, ignore punctuation)
p palindrome?("Oozy rat in a sanitary zoo.")
p palindrome?("Yo, banana boy!")
p palindrome?("Madam, in Eden, I’m Adam.")