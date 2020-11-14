# RB120-RB129 OOP
# OO Basics Accessor Methods - Problem 2 : Choose the Right Method
# Fri. 11/13/20

# PROBLEM STATEMENT
=begin
Add the appropriate accessor methods to the following code.

class Person
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name

Expected output:
Jessica

=end
# CODE

class Person
  attr_writer :phone_number
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name