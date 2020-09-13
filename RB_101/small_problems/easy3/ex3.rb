# RB101-RB109 Small Problems
# Easy 3 - Problem 3: Counting the Number of Character
# Sun. 09/06/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Write a program that will ask a user for an input of a word or
multiple words and give back the number of characters.
Spaces should not be counted as a character.

input:

Please write word or multiple words: walk
output:

There are 4 characters in "walk".
input:

Please write word or multiple words: walk, don't run
output:

There are 13 characters in "walk, don't run".

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
puts "Please write word or multiple words: "
words = gets.chomp
count = 0
words.each_char{|char| count += 1 unless char == " " }
puts "There are #{count} characters in #{words}."

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Uses #delete on the input string (deletes " ") and the finds the #length or
# size of the mutated string w/o white spaces.

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes