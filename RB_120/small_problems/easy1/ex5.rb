# RB120-RB129 OOP Small Problems
# Easy 1 - Problem 5 : Fix the Program - Persons
# Tues. 11/17/20

# PROBLEM STATEMENT
=begin
Complete this program so that it produces the expected output:

class Person
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person

Expected output:
John Doe
Jane Smith

=end
# CODE
class Person
  def first_name=(first_name)
    @first_name = first_name.capitalize
  end

  def last_name=(last_name)
   @last_name = last_name.capitalize
  end

  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person