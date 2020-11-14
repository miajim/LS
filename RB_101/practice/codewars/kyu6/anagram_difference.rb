=begin
Given two words, how many letters do you have to remove from them to make them anagrams?
Example


First word : c od e w ar s (4 letters removed) remove: odws remain: cear
Second word : ha c k er r a nk (6 letters removed) remove: hakrnk remain: cera
Result : 10
Hints
A word is an anagram of another word if they have the same letters (usually in a different order).
Do not worry about case. All inputs will be lowercase.



# Notes
Inputs
  -
Outputs
  -
Rules/Req's
  - letters that remain are the same, but may be in a different order unless sorted
  - letter count is equal in both strings, keep the letter
  - letter count in str1 > letter count in str2, deleted letters = str1count - str2 count
    and vice versa
Questions
  -
  -
Algorithm
  - initialize an array constant to store letters "a" to "z"
  - initialize a variable to keep track of the # of deleted chars
  - iterate over the constant & determine how many of each char appear in both strings
  - if the letter count in string 1 does NOT equal the letter count in str 2,
    increment the number of deleted letters by the difference in count
    (same goes for the opposite)
  - return the deleted letters count
=end

ALPHABET = ("a".."z").to_a

# Initial Solution
# def anagram_difference(str1, str2)
#   num_deleted = 0
#   ALPHABET.each do |char|
#     str1_count = str1.count(char)
#     str2_count = str2.count(char)
#     num_deleted += (str1_count - str2_count).abs if str1_count != str2_count
#   end
#   num_deleted
# end

# Refactored Solution
# def anagram_difference(str1, str2)
#   ALPHABET.map { |n| (str1.count(n) - str2.count(n)).abs }.reduce(:+)
# end


# Ultra-Refactored
# Refactored Solution
def anagram_difference(str1, str2)
  ("a".."z").map { |n| (str1.count(n) - str2.count(n)).abs }.reduce(:+)
end


p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10
