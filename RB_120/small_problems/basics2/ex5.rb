# RB120-RB129 OOP
# OO Basics Classes & Objects 2 - Problem 5 : Counting Cats
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the following code, create a class named Cat that tracks the number of
times a new Cat object is instantiated. The total number of Cat instances should
be printed when ::total is invoked.

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total

Expected total:
2

=end
# CODE

class Cat
  @@num_cats = 0

  def initialize
    @@num_cats += 1
  end

  def self.total
    p @@num_cats
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
