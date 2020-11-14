# Example 1 from Live Session: Beginning Ruby Part 5
# Tues. 10/20/20

=begin
Write a method that takes an array of strings, and returns an array of the same
string values, except with the vowels removed.

p remove_vowels(["green", "yellow", "black", "white"]) == ["grn", "yllw", "blck", "wht"]

input: one array, string objects
output: one array, SAME string objects (i.e., new array, mutated string objects)
assumptions:
- ignore non-alphabetical characters (they remain in the string)
- all vowels should be removed (case-insensitive)
- assuming all strings will always be one word only (no spaces)

ALGO
- define a constant with vowels
- iterate through input array (word)
- iterate through the constant w/ vowels
  - count the number (n) of that vowel in the word
  - find the index of that vowel and remove it n times
  - return the mutated string
  - repeat for every word
- return the array with the mutated strings
=end

# VOWELS = %w(a e i o u)

# def remove_vowels(arr)
#   arr.map do |word|
#     word.downcase!
#     VOWELS.each do |vowel|
#     word.delete!(vowel) if word.include?(vowel)
#     end
#     word
#   end
# end

# my refactored solution
VOWELS = "aeiouAEIOU"

def remove_vowels(arr)
  arr.map { |word| word.delete!(VOWELS) }
end

p remove_vowels(["green", "yellow", "black", "white"]) == ["grn", "yllw", "blck", "wht"]

# Conrad's (LS) Solution
# VOWELS = ["a", "e", "i", "o", "u"]

# def remove_vowels(strings)
#   strings.map do |string|
#     chars = string.split("")
#     VOWELS.each { |vowel| chars.delete(vowel) }
#     chars.join("")
#   end
# end

# p remove_vowels(["green", "yellow", "black", "white"]) == ["grn", "yllw", "blck", "wht"]