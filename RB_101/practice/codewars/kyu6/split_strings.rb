=begin
Mon. 11/2/20
Split Strings (6 kyu)

Complete the solution so that it splits the string into pairs of two characters.
If the string contains an odd number of characters then it should replace the
missing second character of the final pair with an underscore ('_').

# Notes
Inputs
  - one string
Outputs
  - an array of substrings
Rules/Req's
  - must include an "_" for the last char if the string length is odd to
    complete the pair
  - Assume chars can be anything, doesn't matter (space could be part of a pair)
  - an empty input string should return an empty array
Questions
  -
  -
Algorithm
  - determine the length of the input string and if it is odd, append an "_"
  - iterate through the string, creating substrings of length 2
    - starting substring index increments by 2 to the length - 1 of the string
    - append the substring to a new array
  - return the substring array
=end

# Initial Solution
# def solution(str)
#   return [] if str.empty?
#   str << "_" if str.size.odd?
#   i = 0
#   result = []
#   loop do
#     result << str[i, 2]
#     break if i == str.size - 2
#     i += 2
#   end
#   result
# end

# Refactored Solution
def solution(str)
  str << "_" if str.size.odd?
  (0...str.size).to_a.select { |n| n.even? }.each_with_object([]) { |i, arr| arr << str[i, 2] }
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []
