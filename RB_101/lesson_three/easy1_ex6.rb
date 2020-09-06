# RB101-RB109 Lesson 3
# Practice Poblems - Easy 1: Question 6
# Thurs. 09/03/2020

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Starting with the string:

famous_words = "seven years ago..."
show two different ways to put the expected "Four score and " in front of it.

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# Option 1
famous_words = "seven years ago..."
p famous_words.prepend("Four score and ") # destructive method

# Option 2
famous_words = "seven years ago..."
p "Four score and ".concat(famous_words) # destructive method

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Additional (3rd) Option from LS
# Four score and " + famous_words

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
=begin

=end
