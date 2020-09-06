# RB101-RB109 Lesson 3
# Practice Poblems - Easy 2: Question 2
# Friday. 09/04/2020

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Questions
Starting with this string:

munsters_description = "The Munsters are creepy in a good way."
Convert the string in the following ways (code will be executed on original munsters_description above):

"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase!


# "The munsters are creepy in a good way."
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.tr!('M', 'm')

#"the munsters are creepy in a good way."
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.downcase!

# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.upcase!

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
Note that String#capitalize returns a copy of str with the first CHARACTER
of the entire string convereted to uppercase and the remainder to lowercase.

=end