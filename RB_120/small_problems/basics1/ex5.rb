# RB120-RB129 OOP
# OO Basics Classes & Objects 1 - Problem 5: Hello, Sophie! (Part 1)
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the code from the previous exercise, add a parameter to #initialize that
provides a name for the Cat object. Use an instance variable to print a greeting
with the provided name. (You can remove the code that displays I'm a cat!.)

Expected output:
Hello! My name is Sophie!

=end
# CODE
class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new("Sophie")