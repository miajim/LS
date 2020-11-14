# RB120-RB129 OOP
# OO Basics Accessor Methods - Problem 4 : Comparing Names
# Fri. 11/13/20

# PROBLEM STATEMENT
=begin
Using the following code, add the appropriate accessor methods. Keep in mind
that the last_name getter shouldn't be visible outside the class, while the
first_name getter should be visible outside the class.

class Person
  def first_equals_last?
    first_name == last_name
  end
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

Expected output:
false

=end
# CODE

class Person
  attr_writer :last_name
  attr_accessor :first_name
  def first_equals_last?
    first_name == last_name
  end

  private
  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?