# RB120-RB129 Object Oriented Programming
# Lesson 2 - Lecture Classes & Objects: Exercise 5
# Sun. 11/15/20
=begin
Continuing with our Person class definition, what does the below print out?
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
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

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
# => Will format the object as a string representation of itself, with the class
# name and an encoded version of the object ids