# RB101-RB109 Lesson 3
# Practice Problems - Hard 1: Question 1
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
What do you expect to happen when the greeting variable is referenced in the
last line of the code below?

if false
  greeting = “hello world”
end

greeting

=end

# CODE
# I would expect the if..end to not be executed and greeting would not be
# recognized, thus generating an error.

# LS Solution
# greeting = nil and does not raise an error because it was initialized.
# Initializing a local variable within an if block (even if the if block isn't executed)
# initializes a local variable to nil.
# If greeting had not been initialized, then it would generate an error.