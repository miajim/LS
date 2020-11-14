=begin
Watch Others Code (Part 4)
Example 2 of 2: Scramble
Fri. 10/23/20

Write function scramble(str1, str2) that returns true if a portion of str1
characters can be rearranged to match str2, otherwise returns false.

For example:
str1 is 'rkqodlw' and str2 is 'world' the output should return true.
str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return ture.
str1 is 'katas' and str2 is 'steak' should return false.

Only lower case letters will be used (a-z). No punctuation or digits will be
included.

# Notes
Inputs
  - two strings
    - 1st string is a "character bank", 2nd string is used as comparison
    - i.e., can I form the 2nd word using the characters in the first word
Outputs
  - boolean (T/F)
Rules/Req's
  - all input strings are lowercase a-z chars only, no spaces
  -
  -
Questions
  -
  -
Algorithm
  - iterate over the 2nd string (chars)
  - if the 1st string includes the current character
    - permanently delete the char from the 1st string
  - otherwise the 1st string does not include the current character and the
    character cannot be deleted from the string (thus returning nil)
      - deleting the character accounts for repeat characters (no double counting
        of chars in str1)
  - so if ALL characters from the string we're iterating over can be deleted
    from the 1st string, we should return true (2nd word can be formed using
    the characters in the first word). Otherwise we shoudl return false
  -
=end

# Initial Solution
def scramble(str1, str2)
  str2.chars.all? { |char| str1.sub!(char, "") if str1.include?(char)}
end

# Refactored
def scramble(str1, str2)
  str2.chars.all? { |char| str1.sub!(char, "") }
end

# Amanda's (LS) Solution
# def scramble(str1, str2)
#   str2_chars = str2.chars
#   str2_chars.each do |char2|
#     return false if str2.count(char2) > str1.count(char2)
#   end
#   true
# end

p scramble('javaaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true