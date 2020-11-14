# RB120-RB129 OOP
# OO Basics Classes & Objects 1 - Problem 9: Accessor
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the following code, create a module named Walkable that contains a method
named #walk. This method should print Let's go for a walk! when invoked.
Include Walkable in Cat and invoke #walk on kitty.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

Expected output:
Hello! My name is Sophie!
Let's go for a walk!
=end

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end


kitty = Cat.new('Sophie')
kitty.greet
kitty.walk