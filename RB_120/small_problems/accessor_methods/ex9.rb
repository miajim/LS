# RB120-RB129 OOP
# OO Basics Accessor Methods - Problem 9 : Calculated Age
# Sat. 11/14/20

# PROBLEM STATEMENT
=begin
Using the following code, multiply @age by 2 upon assignment, then multiply @age
by 2 again when @age is returned by the getter method.

class Person
end

person1 = Person.new
person1.age = 20
puts person1.age

Expected output:
80

=end
# CODE

class Person
  def age
    @age * 2
  end
  def age=(new_age)
    @age = new_age * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age

# Alternative solution (LS)
class Person
  def age=(age)
    @age = double(age)
  end

  def age
    double(@age)
  end

  private

  def double(value)
    value * 2
  end
end