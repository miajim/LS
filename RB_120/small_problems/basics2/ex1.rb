# RB120-RB129 OOP
# OO Basics Classes & Objects 2 - Problem 1: Generic Greeting (Part 1)
# Thurs. 11/12/20

# PROBLEM STATEMENT
=begin
Modify the following code so that Hello! I'm a cat! is printed when
Cat.generic_greeting is invoked.

class Cat
end

Cat.generic_greeting


Expected output:
Hello! I'm a cat!
=end
# CODE

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# Further Exploration
kitty = Cat.new
kitty.class.generic_greeting # => Will output the string "Hello! I'm a cat!"
# kitty.class returns the Cat class