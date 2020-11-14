=begin
Sun. 11/8/20
Anagram Detection

An anagram is the result of rearranging the letters of a word to produce a
new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams
of each other; return false otherwise.

Examples
"foefet" is an anagram of "toffee"

"Buckethead" is an anagram of "DeathCubeK"

# Notes
Inputs
  - two strings, words w/ a-z or A-Z only
Outputs
  - boolean (T/F)
Rules/Req's
  - anagram: a word whose letters can be rearranged to form a new word
  - if the two arguments are anagrams, return true, otherwise return false
  - assume we cannot mutate either input string
Questions
  -
  -
Algorithm
  - downcase both input strings
  - duplicate string2
  - iterate over each character of the string 1, checking to see if it is contained
    in string 2
    - if it is, delete the character from the duplicate of string2
      - delete at the index of the first occurrence of the character
    - otherwise return false
  - after iteration if the method hasn't already returned false, return true

Alternative Algorithm
  - downcase then sort both strings (convert to arrays first) and check to see
  if these are equal
=end

# def is_anagram(word1, word2)
#   return false if word1.size != word2.size
#   word2_copy_arr = word2.downcase.dup
#   word1.downcase.chars.each do |char|
#     word2_copy_arr.sub!(char, "") if word2_copy_arr.include?(char)
#   end
#   word2_copy_arr.empty?
# end

# def is_anagram(word1, word2)
#   (word1 + word2).downcase.chars.uniq.all? do |char|
#     word1.downcase.count(char) == word2.downcase.count(char)
#   end
# end


# Alternative Algorithm
# def is_anagram(word1, word2)
#   word1.downcase.chars.sort.join == word2.downcase.chars.sort.join
# end


p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false