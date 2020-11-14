=begin
Mon. 11/2/20
Count and Group Character Occurrences in a String (6 kyu)

Write a method that takes a string as an argument and groups the number of times
each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.

# Notes
Inputs
  - one string (could have any chars)
Outputs
  - a hash with integers as keys and arrays as values
Rules/Req's
  - count the number of each alphabetical char (case-insensitive)
    - i.e., "h" and "H" both count as "h"
  - spaces, special chars, etc. are not counted
Questions
  -
  -
Algorithm
  - create an array constant with strings with "a" - "z" representing the alphabet
  - permanently downcase the input string
  - iterate over the array constant, checking to see if the input string
    contains the current letter
    - if it does, count the number of occurrences of the letter
    - the # of occur. == key value in the hash and the current letter becomes
      an element in the array corresponding to the hash
    - otherwise (if the string doesn't contain the current letter) do nothing
  - sort the values in the hash (alphabetically) after iteration
  - return the hash
=end

ALPHABET = ("0".."9").to_a + ("a".."z").to_a

=begin
# no need to sort the strings in the array b/c the iteration is already in
# alphabetical order

Updated Algorithm

  - create an array constant with strings with "a" - "z" representing the alphabet
  - permanently downcase the input string
  - iterate over the array constant, checking to see if the input string
    contains the current letter
    - select the letters that show up at least once in the input string
  - iterate over this filtered array of letters, on each iteration, creating
    a new subarray with the letter and the # of occurrences
  - sort this nested array by the # of occurrences (from highest to lowest)
  -
    - if it does, count the number of occurrences of the letter
    - the # of occur. == key value in the hash and the current letter becomes
      an element in the array corresponding to the hash
    - otherwise (if the string doesn't contain the current letter) do nothing
  - sort the values in the hash (alphabetically) after iteration
  - return the hash
=end

# Option 1a
# def get_char_count(str)
#   str.downcase!
#   ALPHABET.each_with_object(Hash.new([])) do |char, hsh|
#     hsh[str.count(char)] += [char] if str.include?(char)
#   end.sort_by { |k, _| k}.reverse.to_h
# end

# # Option 1b
# def get_char_count(str)
#   str.downcase!
#   ALPHABET.each_with_object(Hash.new {|hsh, key| hsh[key] = []}) do |char, hsh|
#     hsh[str.count(char)] << char if str.include?(char)
#   end.sort_by { |k, _| k}.reverse.to_h
# end

# Option 2
# def get_char_count(str)
#   str.downcase!
#   hsh = {}
#   ALPHABET.each do |char|
#     if str.include?(char)
#       count = str.count(char)
#       if hsh.key?(count)
#         hsh[count] << char
#       else
#         hsh[count] = [char]
#       end
#     end
#   end
#   hsh.sort_by { |k, _| k}.reverse.to_h
# end

# Option 3 (using group_by)
def get_char_count(str)
  hsh = ALPHABET.group_by { |char| str.downcase.count(char) }
  hsh.delete(0)
  hsh.sort.reverse.to_h
end

p get_char_count("Mississippi") #== {4=>["i", "s"], 2=>["p"], 1=>["m"]}
# p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
# p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
# p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
# p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
