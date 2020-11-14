# RB120-RB129 OOP
# OO Basics Classes & Objects 1 - Problem 6: Hello, Sophie! (Part 2)
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the code from the previous exercise, move the greeting from the
#initialize method to an instance method named #greet that prints a greeting
when invoked.

Expected output:
Hello! My name is Sophie!

=end
# CODE
class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new("Sophie")
kitty.greet
