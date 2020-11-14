# RB120-RB129 OOP
# OO Basics Classes & Objects 2 - Problem 6 : Colorful Cat
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the following code, create a class named Cat that prints a greeting when
#greet is invoked. The greeting should include the name and color of the cat.
Use a constant to define the color.

kitty = Cat.new('Sophie')
kitty.greet

Expected output:
Hello! My name is Sophie and I'm a purple cat!
=end
# CODE


class Cat
  COLOR = "purple"

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
