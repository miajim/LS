# RB101-RB109 Small Problems
# Medium 2 - Problem 1: Longest Sentence
# Thurs. 10/29/20

# PROBLEM STATEMENT
=begin
Write a program that reads the content of a text file and then prints the
longest sentence in the file based on number of words. Sentences may end with
periods (.), exclamation points (!), or question marks (?). Any sequence of
characters that are not spaces or sentence-ending characters should be treated
as a word. You should also print the number of words in the longest sentence.

See ex1_text.txt for the text file to read.

The longest sentence in the above text is the last sentence; it is 86 words long. (Note that each -- counts as a word.)

Further Exploration
You may have noticed that our solution fails to print the period at the end of the sentence.
Can you write a solution that keeps the period printed at the end of each sentence?

What about finding the longest paragraph or longest word? How would we go about solving that problem?

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    -
  Outputs
    -
Rules/Implicit Requirements
  -
  -
  -
Clarifying Questions
  -
Mental Model (optional)
  -

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    -
  Rules
    -

ALGORITHM
  - read the data file and split sentences into words
  - create an array constant with punctuation as strings
  - create two array variables:
      1) store the all the sentences
      2) store the individual words that comprise a single sentence, which
          will be overwritten once a complete sentence is found
  - iterate through the array of words
    - if the word does contain punctuation <-- if it includes punctuation,
        the punctuation will be the last char in the word
      - then append the current word (w/ punc.) to the temp sentence array
      - append the temp sentence array to the "all sentences" array
      - "reset" the temp sentence array to an empty array
    - else (it doesn't contain punctuation)
      - append the current word to temp_sentence
  - sort the sentences by length and return the sentence with the longest length
    along with the length of the sentence
    - e.g., "This is the longest sentence. It is 5 words long."
    - The longest length will be determined by the number words in each subarray.
=end

require 'open-uri'
# file_data = open("http://www.gutenberg.org/cache/epub/84/pg84.txt").read.split(" ")

# file_data = File.read("ex1_text.txt").split(" ")

text = File.read('ex1_text.txt')
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }

largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
# puts "Containing #{number_of_words} words"


# PUNCTUATION = %w(. ! ?)

# sentences = []
# temp_sentence = []

# file_data.each do |word|
#   temp_sentence << word
#   if PUNCTUATION.include?(word[-1])
#     sentences << temp_sentence
#     temp_sentence = []
#   end
# end

# longest_sentence = sentences.max_by { |subarr| subarr.length }
# num_words = longest_sentence.size

# puts "The longest sentence is: \n\n #{longest_sentence.join(" ")} \n\n It is #{num_words} words long."

=begin
Further Exploration
- For the longest paragraph, you could define a paragraph by the number of sentences.
- A paragraph could define 4 sentences, and thus you would split the string after
  4 punctuation marks had been encountered. Or you could keep the string split per sentence
  and group 4 paragraphs together.
=end