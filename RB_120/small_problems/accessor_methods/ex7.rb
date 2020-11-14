# RB120-RB129 OOP
# OO Basics Accessor Methods - Problem 7 : Prefix the Name
# Fri. 11/13/20

# PROBLEM STATEMENT
=begin
Using the following code, add the appropriate accessor methods so that
@name is returned with the added prefix 'Mr.'.


class Person
end

person1 = Person.new
person1.name = 'James'
puts person1.name

Expected output:
Mr. James

=end
# CODE

class Person
  attr_writer :name
  def name
    "Mr. " + @name
    # "Mr. #{@name}" is a better solution, b/c it interpolates @name
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name