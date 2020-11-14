=begin
Wed. 10/21/20

https://www.codewars.com/kata/57eb8fcdf670e99d9b000272/train/ruby

Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

# PEDAC
- input: one string, multiple words, words are separated by one space
- output: one string, word with the highest score
- Assume: ASCII order is used, any non-alphabetic characters can be used
- Assumption about ASCII order was incorrect. Going to assume all characters
are alphabetic and lowercase and create a constant for reference of the score

ALGO
- split the string into words
- determine the score of each word
  - iterate over list of words, iterate over each word
  - find the ASCII value of each character, keep track of the score of each word
- iterate through the scores, saving the max score and replacing as necessary
  - if score > max, max = score
  - store the index of the max
  - this will automatically find the first word with the max score, even if two words both have the max score
=end

POINTS = ("a".."z").zip(1..26).to_h

# ORIGINAL
# def high(x)
#   words = x.split(" ")
#   scores = words.map do |word|
#     sum = 0
#     word.each_char { |char| sum += POINTS[char] }
#     sum
#   end
#   words[scores.index(scores.max)]
# end

# CURRENT RUNNING CHAMPION MODEL
def high(x)
  max = 0
  index = 0
  words = x.split
  words.each_with_index do |word, i|
    current_score = word.chars.reduce(0) { |sum, char| sum + POINTS[char] }
    max, index = current_score, i if current_score > max
  end
  words[index]
end

# REFACTORED
# def high(x)
#   words = x.split(" ")
#   scores = words.map { |word| word.chars.reduce(0) { |sum, char| sum + POINTS[char] } }
#   words[scores.index(scores.max)]
# end

# # SUPER REFACTORED
# def high(x)
#   x.split.each_with_object(Hash.new(0)) { |word, scores| word.each_char { |char| scores[word] += POINTS[char] } }.max_by { |_, v| v }[0]
# end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'

