# RB101-RB109 Small Problems
# Easy 4 - Problem 5: Multiples of 3 and 5
# Fri. 09/11/20

# PROBLEM STATEMENT
=begin
Write a method that searches for all multiples of 3 or 5 that lie between
1 and some other number, and then computes the sum of those multiples.
For instance, if the supplied number is 20, the result should be
98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

- create an array of positive integers starting at 1 up to and including the input number
- for each number, check if it is a multiple of 3 or 5
- if it is, store the number in an array
- sum the numbers in the results array

Examples

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

Further Exploration

Investigate Enumerable.inject (also known as Enumerable.reduce),
How might this method be useful in solving this problem?
(Note that Enumerable methods are available when working with Arrays.)
Try writing such a solution. Which is clearer? Which is more succinct?

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
Inputs
Outputs
Rules/Implicit Requirements
Clarifying Questions
Mental Model (optional)

EXAMPLES/TEST CASES

DATA STRUCTURE
Inputs
Rules

ALGORITHM
=end

# CODE
def multiple_3_or_5?(num)
  (num % 3 == 0) || (num % 5 == 0)
end

# def multisum(num)
#   results = (1..num).each_with_object([]) do |number, multiples|
#     if multiple_3_or_5?(number)
#       multiples << number
#     end
#   end
#   results.sum
# end

# Further Exploration
# This method makes the code more succinct, however I don't know that it's
# much clearer or easier to understand.
# You can reduce to both iterate, add numbers to the sum as appropriate, and
# return the total sum without having to create new variables outside of the
# scope of the reduce method and associated block.

def multisum(num)
  (1..num).reduce(0) do |sum, number|
    multiple_3_or_5?(number) ? (sum + number) : (sum + 0)
  end
end

# without using the additional method and further refactored:
def multisum(max)
  (1..max).reduce(0) { |sum, num| (num % 3 == 0) || (num % 5 == 0) ? (sum + num) : (sum) }
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
