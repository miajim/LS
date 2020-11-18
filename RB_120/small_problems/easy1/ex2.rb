# RB120-RB129 OOP Small Problems
# Easy 1 - Problem 2 : What's the Output?
# Mon. 11/16/20

# PROBLEM STATEMENT
=begin
Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

What output does this code print? Fix this class so that there are no surprises
waiting in store for the unsuspecting developer.

Further Exploration
What would happen in this case?

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

This code "works" because of that mysterious to_s call in Pet#initialize.
However, that doesn't explain why this code produces the result it does. Can you?

=end
# CODE
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{name.upcase}."
  end
end

# original outputs in comments

# name = 'Fluffy'
# fluffy = Pet.new(name) # => @name = 'Fluffy'
# puts fluffy.name  # => Fluffy
# puts fluffy # => @name = 'FLUFFY', My name is FLUFFY.
# puts fluffy.name # => FLUFFY
# puts name # => FLUFFY

# Further Exploration
=begin
#to_s looks to the caller to determine the method lookup path. Since
42 is an instance of the Integer class, it looks at the #to_s definition within
the Integer class.
=end

name = 42
fluffy = Pet.new(name) # => @name = '42'
name += 1 # => name = 43
puts fluffy.name # => '42'.
puts fluffy # => 'My name is 42.'
puts fluffy.name # =>  '42'.
puts name # => '43'