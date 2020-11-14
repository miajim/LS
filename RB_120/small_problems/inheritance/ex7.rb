# RB120-RB129 OOP
# OO Basics Inheritance - Problem 7 : Method Lookup (Part 1)
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin

Using the following code, determine the lookup path used when invoking
cat1.color. Only list the classes that were checked by Ruby when searching for
the #color method.

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

=end
# CODE

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color # => Lookup Path: Cat, Animal
p Cat.ancestors