# RB120-RB129 OOP Small Problems
# Debugging - Problem 4: ????
# Mon. 12/7/20

# PROBLEM STATEMENT
=begin


=end
# CODE

class Animal
  def speak
    puts "Animal is speaking"
  end

  alias_method :talk, :speak

end

class Cat < Animal
  def speak
    puts "Cat is speaking"
  end
end

# Animal#speak is still available to the Animal class and any descendants
# via it's alias (Animal#talk), even though the speak method may be overrritten.

kitty = Cat.new
# kitty.speak # => Cat is speaking
# kitty.talk  # => Animal is speaking

animal = Animal.new
# animal.talk  # => Animal is speaking

case kitty
when Cat then puts "I'm a Cat!"
when Animal then puts "I'm an Animal!"
else puts "Other"
end

p Cat.ancestors