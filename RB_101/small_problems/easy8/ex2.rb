# RB101-RB109 Small Problems
# Easy 8 - Problem 2: Madlibs
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Mad libs are a simple game where you create a story template with blanks for
words. You, or another player, then construct a list of words and place them
into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and
an adjective and injects those into a story that you create.

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    -
  Outputs
    -
Rules/Implicit Requirements
  -
  -
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
  -
=end

# CODE
print "Enter a noun: "
noun = Kernel.gets.chomp
print "Enter a verb: "
verb = Kernel.gets.chomp
print "Enter an adjective: "
adj = Kernel.gets.chomp
print "Enter an adverb: "
adverb = Kernel.gets.chomp

puts "Do you #{verb} your #{adj} #{noun} #{adverb}? That's hilarious!"