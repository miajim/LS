# LS Ruby Challenge Problems (New)
# Easy - Problem 1: Triangles
# Sat. 01/23/2021

=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and
the sum of the lengths of any two sides must be greater than or equal to the length of the third side.

=end

=begin
# Notes
Inputs
  - three integers, passed when a triangle obj. is instantiated
Outputs
  - one string, representing the type of triangle (equilateral, isoceles, or scalene)
Rules/Req's
  - the three sides (integers) must be able to form a triangle
    - all sides must be > 0
    - sum of any two sides >= third side
  - ArgumentError is thrown when the object is instantiated but cannot form a
    valid triangle
  - Triangle#kind determines the type of triangle and returns a string
Questions
  -
  -
Algorithm
  - create a Triangle class with a #initialize and #kind.
  - #initialize
    - throw an argument error when the triangle is invalid
      - see rules above for invalid triangle
  - #kind
    - if-elsif-else to check if all three sides are the same or if all are different
    - return string representing type of triangle
=end

# CODE

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    raise ArgumentError unless valid_triangle?
  end

  def kind
    if @sides.uniq.size == 1
      'equilateral'
    elsif @sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid_triangle?
    # @sides.all? { |side| side > 0 } && @sides[0..1].sum >= @sides[-1]
    @sides[0] > 0 && @sides[0..1].sum >= @sides[2]
  end
end

# triangle = Triangle.new(0.4, 0.6, 0.3)
# p triangle.kind