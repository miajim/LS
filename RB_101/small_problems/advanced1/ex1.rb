# RB101-RB109 Small Problems
# Advanced 1 - Problem 1: Madlibs Revisited
# Sat. 10/31/20

# PROBLEM STATEMENT
=begin
Let's build another program using madlibs. We made a program like this in the
easy exercises. This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have
created, and then plugs in a selection of randomized nouns, verbs, adjectives,
and adverbs into that text and prints it. You can build your lists of nouns,
verbs, adjectives, and adverbs directly into your program, but the text data
should come from a file or other external source. Your program should read
this text, and for each line, it should place random words of the appropriate
types into the text, and print the result.



--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - strings from a text file
  Outputs
    - modified strings
Rules/Implicit Requirements
  - place random nouns, verbs, etc. into the input text and print the modified
    text
  - Assume that replacement words can be repeated
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
  - create a hash constant with adjectives, nouns, verbs, and adverbs as keys
    and corresponding word types as values
  - import data from text file as strings
  - iterate through the strings (words)
  - if the current word is one of the keys in the hash constant, then
    select a random value from the corresponding key and replace the word in
    the string with the value.
  - print the modified string to the console
=end

WORD_BANK = {
  "adjectives" => %w(quick lazy sleepy ugly),
  "nouns" => %w(fox dog head leg),
  "verbs" => %w(jumps lifts bites licks),
  "adverbs" => %w(easily lazily noisily excitedly)
}

# Initial Solution (replaces all words of the same type with the same word)
# file_data = File.read("ex1_text.txt")

# puts file_data, "\n\n"

# WORD_BANK.each_key do |type|
#   file_data.gsub!("%{#{type[0...-1]}}", WORD_BANK[type].sample)
# end

# puts file_data


# Second Solution (More variety to replaced words but missing any puncutation)
# file_data = File.read("ex1_text.txt").split(" ")

# # puts file_data

# file_data.map! do |word|
#   if word.start_with?("%")
#     array = WORD_BANK["#{word.gsub(/[^a-z]/i, "")}s"]
#     array.sample
#   else
#     word
#   end
# end
# puts file_data.join(" ")

# Third Solution (Substitute within the string, leaving punctuation intact)
file_data = File.read("ex1_text.txt")

puts file_data, "\n" # Original string

types = WORD_BANK.keys.map { |type| type[0...-1] }

types.each do |type|
  file_data.count(type).times do |_|
    file_data.sub!("%{#{type}}", WORD_BANK["#{type}s"].sample)
  end
end

puts file_data # Modified string