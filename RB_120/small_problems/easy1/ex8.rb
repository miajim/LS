# RB120-RB129 OOP Small Problems
# Easy 1 - Problem 8 : Rectangles and Squares
# Tues. 11/17/20

# PROBLEM STATEMENT
=begin
Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

Write a class called Square that inherits from Rectangle, and is used like this:

square = Square.new(5)
puts "area of square = #{square.area}"


=end
# CODE
class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side_length)
    super(side_length, side_length)
  end

  def to_s
    "area of square = #{self.area}"
  end
end

square = Square.new(5)
puts square