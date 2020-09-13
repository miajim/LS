# RB101-RB109 Lesson 4
# Practice Problems: Additional Practice - Practice Problem 9
# Thurs. 09/10/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
As we have seen previously we can use some built-in string methods to
change the case of a string. A notably missing method is something provided
in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails
creates a string that has each word capitalized as it would be in a title.
For example, the string:

words = "the flintstones rock"
would be:

words = "The Flintstones Rock"
Write your own version of the rails titleize implementation.

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
words = "the flintstones rock"
# Algorithm 1
  # split the string into an array of individual words
  # take each word in the array and capitalize it
  # join the words in the array to form a string

titleize = words.split.map {|word| word.capitalize}.join(" ")
p titleize

# Algorithm 2
  # capitalize the entire string (capitalizes the first letter of the first words only)
  # use this modified string to capitalize the first character that appears after a space
  # Append all characters (modified or unmodified) to a new string

words.capitalize!
titleize = ""
prev_char = ""

words.each_char do |char|
  char.capitalize! if prev_char == " " # note that the destructive method does not affect the original string! Strings technically aren't collections
  titleize << char
  prev_char = char
end

p titleize

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
# (same as option 1)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

=end