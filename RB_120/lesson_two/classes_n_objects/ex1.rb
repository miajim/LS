# RB120-RB129 Object Oriented Programming
# Lesson 2 - Lecture Classes & Objects: Exercise 1
# Sat. 11/14/20
=begin
Given the below usage of the Person class, code the class definition.

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'

=end

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
    # self.name = name
  end
end

bob = Person.new('bob')
puts bob.name                  # => 'bob'
bob.name = 'Robert'
puts bob.name                  # => 'Robert'
