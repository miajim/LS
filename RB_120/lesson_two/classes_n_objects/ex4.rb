# RB120-RB129 Object Oriented Programming
# Lesson 2 - Lecture Classes & Objects: Exercise 4
# Sun. 11/15/20
=begin
Using the class definition from step #3, let's create a few more people --
that is, Person objects.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

If we're trying to determine whether the two objects contain the same name,
how can we compare the two objects?
=end

class Person
  attr_accessor :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end

  # moving the logic from initialize to the name setter method
  def name=(new_name)
    parts = new_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def initialize(name)
    self.name = name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
puts bob.name == rob.name