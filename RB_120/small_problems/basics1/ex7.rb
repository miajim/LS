# RB120-RB129 OOP
# OO Basics Classes & Objects 1 - Problem 7: Reader
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the code from the previous exercise, add a getter method named #name and
invoke it in place of @name in #greet.

Expected output:
Hello! My name is Sophie!

=end
# CODE
class Cat
  def name
    @name
  end

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new("Sophie")
puts kitty.name