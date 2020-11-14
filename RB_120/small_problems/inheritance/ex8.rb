# RB120-RB129 OOP
# OO Basics Inheritance - Problem 8 : Method Lookup (Part 2)
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the following code, determine the lookup path used when invoking
cat1.color. Only list the classes and modules that Ruby will check when
searching for the #color method.

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

=end
# CODE

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
p cat1.color # => will return NoMethodError
# => Method Lookup Path: Cat, Animal, Object, Kernel, BasicObject