# RB120-RB129 OOP Small Problems
# Medium 1 - Problem 3: Students
# Tues. 12/8/20

# PROBLEM STATEMENT
=begin
Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation
details for the #initialize methods in Graduate and Undergraduate are missing.
Fill in those missing details so that the following requirements are fulfilled:

Graduate students have the option to use on-campus parking, while Undergraduate
students do not.

Graduate and Undergraduate students both have a name and year associated with them.

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate
  def initialize(name, year, parking)
  end
end

class Undergraduate
  def initialize(name, year)
  end
end

Further Exploration
There is one other "form" of the keyword super. We can call it as super().
This calls the superclass method of the same name as the calling method, but
here no arguments are passed to the superclass method at all.

Can you think of a way to use super() in another Student related class?

=end
# CODE

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end

  def say_hello
    "Hello!"
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  # def initialize(name, year)
  # end
end

# Further Exploration
class ForeignExchangeStudent < Student
  def initialize(name, year, country)
    super(name, year)
    @country = country
  end

  def say_hello
    @country == "China" ? "Ni hao!" : super()
  end
end

# or you could leave Undergraduate#initialize and call super

lindsey = Undergraduate.new("Lindsey", 2012)
lisa = ForeignExchangeStudent.new("Lisa", 2009, "China")
puts lisa.say_hello
puts lindsey.say_hello
