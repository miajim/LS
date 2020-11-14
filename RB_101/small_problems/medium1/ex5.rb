# RB101-RB109 Small Problems
# Medium 1 - Problem 5: Diamonds!
# Tues. 10/27/20

# PROBLEM STATEMENT
=begin

Write a method that displays a 4-pointed diamond in an n x n grid, where n is
an odd integer that is supplied as an argument to the method. You may assume
that the argument will always be an odd integer.

Examples

diamond(1)

*

diamond(3)

 *
***
 *

diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - one ODD integer, n
  Outputs
    - n lines of strings (each string is a combination of spaces and *)
Rules/Implicit Requirements
  - the input integer will alwasy be odd
  - the number of lines output will be equal to n
  - half of the diamond will be a mirror image of itself (symmetric about x-axis)
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
  - get the odd numbers from 1..n
  - iterate from 1..n
  - the first line will have 1 *, (n-1) spaces --> (n-1)/2 spaces to the left
    (n-1)/2 spaces to the right
  - the next line will have 3 *, (n-3) spaces --> (n-3)/2 spaces to the left, etc.
  - do this up to the mid point (i.e., # of * == 9, # of spaces = 0)
  - then do the same from (n-2)..1, except
=end

# Initial Solution
def diamond(n)
  odd_numbers = (1..(n-2)).select { |x| x.odd?}
  odd_numbers.each do |num_stars|
    num_spaces = (n - num_stars) / 2
    puts (" " * num_spaces + "*" * num_stars + " " * num_spaces)
  end
  odd_numbers.pop
  odd_numbers.reverse.each do |num_stars|
    num_spaces = (n - num_stars) / 2
    puts (" " * num_spaces + "*" * num_stars + " " * num_spaces)
  end
end

# Refactored Solution
def diamond(n)
  odd_numbers = (1..(n-2)).select { |x| x.odd?}
  all_numbers = odd_numbers + [n] + odd_numbers.reverse
  all_numbers.each { |num_stars| puts ("*" * num_stars).center(n) }
end

diamond(1)
diamond(3)
diamond(9)

=begin
Further Exploration
Try modifying your solution or our solution so it prints only the outline of the diamond:

diamond(5)

  *
 * *
*   *
 * *
  *

# Algorithm
- Maintain the first and last stars from the number of stars determined

=end

def diamond(n)
  odd_numbers = (1..(n-2)).select { |x| x.odd?}
  all_numbers = odd_numbers + [n] + odd_numbers.reverse
  all_numbers.each do |num_stars|
    num_spaces = (n - num_stars) / 2
    if num_stars == 1
      puts "*".center(n)
    else
      puts (" " * num_spaces + "*" +  " " * (num_stars - 2) + "*" + " " * num_spaces)
    end
  end
end

diamond(5)
diamond(9)