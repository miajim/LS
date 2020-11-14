# RB101-RB109 Small Problems
# Medium 2 - Problem 6: Tri-Angles
# Fri. 10/30/20

# PROBLEM STATEMENT
=begin
A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and
all angles must be greater than 0: if either of these conditions is not satisfied,
the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns
a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle
is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating
point errors. You may also assume that the arguments are specified in degrees.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - 3 integers, representing the angles of a triangle
  Outputs
    - one symbol (:acute, :right, :obtuse, :invalid)
Rules/Implicit Requirements
  - for a triangle to be valid all angles must be greater than 0 AND
    the sum of the angles == 180 deg.
  - right: one angle is 90 deg
  - acute: all 3 angles are less than 90 deg.
  - obtuse: one angle is greater than 90 deg.
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
  - create a helper method to determine if the angles form a valid triangle
    valid if all angles > 0 and sum of angles == 180
  - in the main method:
    - call the helper method to determine if the triangle is valid or not
    - return invalid if not, otherwise
    - if one angle is 90 deg. then return :right
    - if one angle is > 90 deg. the return :obtuse
    - if all angles are less than 90 deg. then return :acute
=end

def valid_triangle?(angles)
  angles.all? { |angle| angle > 0 } && angles.reduce(:+) == 180
end

def triangle(a, b, c)
  angles = [a, b, c]
  unless valid_triangle?(angles)
    :invalid
  else
    if angles.all? { |angle| angle < 90 }
      :acute
    elsif angles.any? { |angle| angle == 90 }
      :right
    elsif angles.any? { |angle| angle > 90 }
      :obtuse
    end
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid