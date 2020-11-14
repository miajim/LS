# RB120-RB129 OOP
# OO Basics Classes & Objects 2 - Problem 7: Identify Yourself (Part 2)
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Update the following code so that it prints I'm Sophie! when it invokes puts kitty.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
puts kitty

Expected output:
I'm Sophie!

=end
# CODE

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty