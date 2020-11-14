# RB120-RB129 OOP
# OO Basics Classes & Objects 2 - Problem 2: Hello, Chloe!
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the following code, add an instance method named #rename that renames kitty when invoked.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
kitty.name
kitty.rename('Chloe')
kitty.name

Expected output:
Sophie
Chloe
=end
# CODE

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name