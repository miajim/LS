# RB120-RB129 OOP
# OO Basics Classes & Objects 2 - Problem 8 : Public Secret
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Using the following code, create a class named Person with an instance variable
named @secret. Use a setter method to add a value to @secret, then use a getter
method to print @secret.

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

Expected output:
Shh.. this is a secret!

=end
# CODE

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret