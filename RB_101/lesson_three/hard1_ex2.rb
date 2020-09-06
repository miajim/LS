# RB101-RB109 Lesson 3
# Practice Problems - Hard 1: Question 2
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

=end

# CODE
# greetings will be modified as well, since informal_greeting is pointing
# to the same object within the hash and mutated that object.
# greetings ==> {a: 'hi there'}

# LS Solution
