# RB101-RB109 Lesson 3
# Practice Problems - Medium 2: Question 6
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
=end

# CODE
def color_valid(color)
  # the statement will return true or false once evaluated
  (color == "blue") || (color == "green")
end

p color_valid("blue") # true
p color_valid("green") # true
p color_valid("purple") # false

# LS Solution
# (same)