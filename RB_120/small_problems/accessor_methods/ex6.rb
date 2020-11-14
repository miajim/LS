# RB120-RB129 OOP
# OO Basics Accessor Methods - Problem 6 : Guaranteed Formatting
# Fri. 11/13/20

# PROBLEM STATEMENT
=begin
Using the following code, add the appropriate accessor methods so that
@name is capitalized upon assignment.

class Person
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name

Expected output:
Elizabeth

=end
# CODE

class Person
  attr_reader :name
  def name=(new_name)
    @name = new_name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name