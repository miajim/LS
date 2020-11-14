# RB120-RB129 OOP
# OO Basics Accessor Methods - Problem 1 : Reading and Writing
# Fri. 11/13/20

# PROBLEM STATEMENT
=begin
Add the appropriate accessor methods to the following code.

class Person
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

Expected output:
Jessica

=end
# CODE

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name