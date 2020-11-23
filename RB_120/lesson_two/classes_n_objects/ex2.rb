# RB120-RB129 Object Oriented Programming
# Lesson 2 - Lecture Classes & Objects: Exercise 2
# Sat. 11/14/20
=begin
Modify the class definition from above to facilitate the following methods.
Note that there is no name= setter method now.

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
=end

class Person
  attr_reader :first_name
  attr_accessor :last_name

  def name
    "#{first_name} #{last_name}"
  end

  def initialize(name)
    @first_name, @last_name = name.split
  end

end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

# LS Solution (more explicit about assigning an empty string to the last name
# if it is not provided)
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end