=begin
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

There are tests with strings up to 10 000 characters long so your code will need to be efficient.

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.

# Notes
Inputs
  - one string of lowercase alphabetical chars only
Outputs
  - one string (substring of the input string, can be of length 1 to length of string)
Rules/Req's
  - return the longest substring in alphabetical
  - if there are two substrings of the same length (both max. substring length) then return the substring
    that appears first (first in the original string)
  -
Questions
  -
  -
Algorithm
  - IGNORE: create a array constant holding the letters a..z
  - initialize a variable to max string length
  - create substrings
    - iterate over the input string, such that the first substring is the length of the input string
      and working backwards from that
    - nested loop, starting at index 0 up to length of the input string
    - count down from length of the input string to 0
    - check if the substring is alphabetical
      - turn the substring into an array
      - sort the array, turn back into a string
      - compare the substring to the sorted string
      - if they are equal and the current substring length exceeds the max, return the substring
=end

=begin
  - iterate though the input string
  - if the next character is the same as the current char OR follows the current character
    - append the current character to the tracking substring
  - otherwise
    - append the current substring to a tracking array of alphabetical substrings
    - reset the tracking substring and start iteration at the next character
  - after iteration you should have an array of alphabetical substring
    - find the substring with the longest length
      - iterate through the array, keeping track of the max length of the substrings
      - if the max length of the current substring exceeds the max, replace
        the substring being stored.
  - return the max substring
=end


# def longest(str)
#   return str if str.size == 1
#   substrings = get_alphabetical_substrings(str)
#   max = 0
#   longest_substr = ""
#   substrings.each do |substr|
#     if substr.size > max
#       max = substr.size
#       longest_substr = substr
#     end
#   end
#   longest_substr
# end

# def get_alphabetical_substrings(str)
#   str_chars = str.chars
#   substr = str_chars[0]

#   substrings = []
#   i = 1
#   loop do
#     comp = str_chars[i-1] <=> str_chars[i]
#     if comp == 0 || comp == -1
#       substr << str_chars[i]
#     else
#       substrings << substr
#       substr = str_chars[i]
#     end
#     i += 1
#     if i == str.size
#       substrings << substr unless substr.empty?
#       break
#     end
#   end
#   substrings
# end

# p get_alphabetical_substrings('nab')
# p get_alphabetical_substrings('abcdeapbcdef')
# p get_alphabetical_substrings('asdfaaaabbbbcttavvfffffdf')

# Initial Solution
# def longest(str)
#   (str.size).downto(1) do |len|
#     (0..(str.size - len)).each do |start_i|
#       substr = str[start_i, len]
#       sorted_substr = substr.chars.sort.join("")
#       return substr if substr == sorted_substr
#     end
#   end
# end

require 'pry'

# Best solution (Jesus Castello) I could find in the answers (something I should be able to come up with)
def longest(s)
  tmp = ""
  arr = s.chars
  arr.map do |ch|
    if (tmp.empty? || ch >= tmp[-1])
      tmp << ch
    else
      tmp = ch
    end
    tmp
    #binding.pry
  end.max_by(&:size)
end

# p longest('asd') == 'as'
# p longest('nab') #== 'ab'
p longest('abcdeapbcdef') #== 'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') =='fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'



# ["nab", "na", "ab", "n", "a", "b"]

