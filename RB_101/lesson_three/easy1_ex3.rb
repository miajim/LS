# RB101-RB109 Lesson 3
# Practice Poblems - Easy 1: Question 3
# Thurs. 09/03/2020

=begin
# -------------------------------------------a-------------------------------------------------------------------------------------------------------------------------
# LS Question
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
advice = "Few things in life are as important as house training your pet dinosaur."

advice.sub("important", "urgent")

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
advice.gsub!('important', 'urgent')

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# main difference between String#sub and String#gsub is that #sub replaces the first occurence
# of the pattern (1st argument) and #gsub replaces ALL instances of the pattern
