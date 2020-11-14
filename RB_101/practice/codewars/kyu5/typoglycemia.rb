=begin
Codewars - Typoglycemia Generator (5 kyu)
Suggested on Christian Larwood's Study Guide
Mon. 10/26/20

Background
There is a message that is circulating via public media that claims a reader can
easily read a message where the inner letters of each words is scrambled, as long
as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the
letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern,
but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are separated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia

# Notes
Inputs
  - one string
Outputs
  - one string
Rules/Req's
  - first and last characters remain in place
  - characters between the first and last characters must be sorted alphabetically
  - punctuation should remain at the same place as it started
  - words are separated by single spaces(i.e., only spaces separate words)
  - special characters do not take the position of non-special chars
    - i.e., if the first char in the word is a special character, it should not move
      and the next char should be treated as the "first" char
Questions
  -
  -
Algorithm
  - create an array constant to reference the special chars
  - split the string into words (i.e., at spaces)
  - determine the bounds of the new word (starting and ending indices)
    - append characters that are outside of the indices to the new string
      as they were originally
    - sort the chars that are within the bounds of the starting and ending
      indices. Be wary of special characters within the bounds
    - using the original string as a guide, append the sorted substring
      character by character, to insert special chars as needed.
  - return the new string object (join the words in the array with a " ")
=end

SPECIAL_CHARS = %w(- ' , .)

def find_bounding_idx(word, reverse = false)
  (word = word.reverse) if reverse
  (0...word.size).each { |i| return i unless SPECIAL_CHARS.include?(word[i]) }
end

def scramble_words(str)
  start_i, end_i = 0, 0

  str.split.map do |word|
    start_i, end_i = find_bounding_idx(word), -1 - find_bounding_idx(word, true)
    word.length <= 3 ? word : sort_chars(word, start_i, end_i)
  end.join(" ")
end

def sort_chars(word, start_idx, end_idx)
  substr_chars = word[(start_idx + 1)...end_idx].chars
  sorted_substr = word[(start_idx + 1)...end_idx].chars
                .delete_if { |char| SPECIAL_CHARS.include?(char) }
                .sort
  final_sort = substr_chars.map do |char|
    SPECIAL_CHARS.include?(char) ? char : sorted_substr.shift
  end
  word[0..start_idx] + final_sort.join("") + word[end_idx...word.size]
end

p scramble_words('professionals') == 'paefilnoorsss' # 'The first and last letters of a word should remain in place with the inner letters sorted'
p scramble_words('i') == 'i'  # 'Must handle single charater words'
p scramble_words('') == '' # 'Must handle empty strings'
p scramble_words('me') == 'me' # 'Must handle 2 charater words'
p scramble_words('you') == 'you' # 'Must handle 3 charater words'
p scramble_words('card-carrying') == 'caac-dinrrryg' # 'Only spaces separate words and punctuation should remain at the same place as it started'
p scramble_words("shan't") == "sahn't" # 'Punctuation should remain at the same place as it started'
p scramble_words('-dcba') == '-dbca' # 'Must handle special character at the start'
p scramble_words('dcba.') == 'dbca.' # 'Must handle special character at the end'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth." # 'Must handle a full sentence'

# Initial Solution
# SPECIAL_CHARS = %w(- ' , .)
# def scramble_words(str)
#   start_i = 0
#   end_i = 0

#   str.split.map do |word|
#     (0).upto(word.size-1) { |i| break (start_i = i) unless SPECIAL_CHARS.include?(word[i]) }
#     (-1).downto(-word.size).each { |i| break (end_i = i) unless SPECIAL_CHARS.include?(word[i]) }
#     if word.length <= 3
#       word
#     else
#       sorted_word = word[(start_i + 1)..(end_i - 1)]
#                     .chars
#                     .delete_if { |char| SPECIAL_CHARS.include?(char) }
#                     .sort
#       idx = -1
#       final_sort = (word[(start_i + 1)..(end_i - 1)].chars.map do |char|
#         if SPECIAL_CHARS.include?(char)
#           char
#         else
#           idx += 1
#           sorted_word[idx]
#         end
#       end).join("")
#       word[0..start_i] + final_sort + word[end_i...word.size]
#     end
#   end.join(" ")
# end