# RB101-RB109 Lesson 3
# Practice Poblems - Easy 1: Question 2
# Thurs. 09/03/2020

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?
2. put ! before something, like !user_name
3. put ! after something, like words.uniq!
4. put ? before something
5. put ? after something
6. put !! before something, like !!user_name

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
1. != represents not equal to and can be used as part of an expression in a conditional statement/expression
2. ! negates the object it precedes and will return either true or false
3. ! after something can either be part of a method or variable name. If it's at the end of a method, it
    might mean the method is destructive
4. ? before something - I've only seen this situation as a ternary operator (?:)
5. ? after something - usually at the end of a method name, might mean the method returns a boolean
6. !! something - turns the object into it's boolean (T/F)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes


=end