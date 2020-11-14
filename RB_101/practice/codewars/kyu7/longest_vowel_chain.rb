=begin
Codewars - Longest Vowel Chain (7 kyu)
Suggested on Christian Larwood's Study Guide
Sun. 10/25/20

The vowel substrings in the word "codewarriors" are "o","e","a","io".
The longest of these has a length of 2. Given a lowercase string that has
alphabetic characters only (both vowels and consonants) and no spaces, return
the length of the longest vowel substring. Vowels are any of aeiou.

# Notes
Inputs
  - one string, all lowercase, a-z, no spacees
Outputs
  - one integer, length of the longest vowel substring
Rules/Req's
  - vowels: a, e, i, o, u
  - vowel substrings: consecutive vowels, in no particular order
  -
Questions
  - Can there be a word with no vowels? i.e., method would return 0
  -
Algorithm
  - create an array? constant to hold the vowels
  - iterate through the characters in the input string
  - if the character is a vowel
    - append the character to a string
    - count the length of the string
    - replace max if count > max
  - otherwise reset the string to an empty string
  - return the integer stored in max
=end


# Initial Solution
# VOWELS = %w(a e i o u)

# def solve(s)
#   max = 0
#   str = ""
#   s.each_char do |char|
#     if VOWELS.include?(char)
#       str << char
#       count = str.size
#       max = count if count > max
#     else
#       str = "" unless str.empty?
#     end
#   end
#   max
# end


=begin
 Alternative Algorithm
  - split the word at vowels
    c/o/d/e/w/a/rr/io/rs
  - remove the substrings with consonants
    o/e/a/io
  - return the length of the longest substring
    io ==> 2s
=end

# Refactored Solution
def solve(s)
  s.split(/[^aeiou]+/).max_by { |str| str.size }.size
end


p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8