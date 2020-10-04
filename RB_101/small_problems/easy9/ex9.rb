# RB101-RB109 Small Problems
# Easy 9 - Problem 9: Grade book
# Sun. 10/04/20

# PROBLEM STATEMENT
=begin
Write a method that determines the mean (average) of the three scores passed to
it, and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'

Tested values are all between 0 and 100. There is no need to check for negative
values or values greater than 100.

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

Further exploration
How would you handle this if there was a possibility of extra credit grades causing it to exceed 100 points?
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

LETTER_GRADE = ['A', 'B', 'C', 'D', 'F']
RANGE = [(90..100).to_a, (80...90).to_a, (70...80).to_a, (60...70).to_a, (0...60).to_a]
GRADE_HASH = Hash[LETTER_GRADE.zip(RANGE)]

def get_grade(score1, score2, score3)
  grades = [score1, score2, score3]
  avg = grades.sum / grades.length
  GRADE_HASH.each { |letter, value_arr| return letter if value_arr.include?(avg) }
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Futher exploartion
# You could add a guard clause that says if the average is > 100, then return 'A+'.