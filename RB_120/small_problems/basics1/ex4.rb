# RB120-RB129 OOP
# OO Basics Classes & Objects 1 - Problem 4: What Are You?
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the code from the previous exercise, create an instance of Cat and assign
it to a variable named kitty.

Code:
class Cat
end

kitty = Cat.new

Expected output:
I'm a cat!

=end
# CODE
class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new