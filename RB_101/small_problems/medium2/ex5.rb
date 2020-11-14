# RB101-RB109 Small Problems
# Medium 2: Problem 5 - Triangle Sides
# Fri. 10/30/20

# PROBLEM STATEMENT
=begin

A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be
greater than the length of the longest side, and all sides must have lengths
greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
on whether the triangle is equilateral, isosceles, scalene, or invalid.

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - three numbers (could be integers or floats)
  Outputs
    - one symbol
Rules/Implicit Requirements
  - valid triangle (both conditions must be met)
    1) all sides must have lengths > 0
    2) the sum of the lengths of the 2 shortest sides > length of longest side
  - triangle classification
    - equilateral (all 3 sides are equal)
    - isoceles (2 of the 3 sides are equal)
    - scalene (none of the sides are equal)
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
  - store the 3 input numbers in an array
  - determine whether the 3 sides form a valid triangle
    - find out if all the lengths are > 0 AND
    - the sum of the two shortest sides > length of the longest side
      - sort the input numbers from highest to lowest
      - sum the last 2 values in the array and compare to the first value (longest)
  - if they do not, return :invalid
  - if they do, determine the type of triangle they form
    - all input numbers are equal --> :equilateral
    - 2 of the 3 input numbers are equal --> :isoceles
    - none of the input numbers are equal --> :scalene
=end

def triangle(a, b, c)
  unless valid_triangle?([a, b, c])
    :invalid
  else
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end
end

def valid_triangle?(sides)
  sides.sort!
  sides.all? { |side| side > 0 } && (sides[0] + sides[1] > sides[2])
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid