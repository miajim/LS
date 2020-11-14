# RB120-RB129 OOP
# OO Basics Classes & Objects 1 - Problem 8: Writer
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the code from the previous exercise, add a setter method named #name.
Then, rename kitty to 'Luna' and invoke #greet again.

Expected output:
Hello! My name is Sophie!
Hello! My name is Luna!

=end
# CODE
class Cat
  attr_reader :name

  def name=(new_name)
    @name = new_name
  end

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new("Sophie")
kitty.greet
kitty.name = "Luna"
kitty.greet