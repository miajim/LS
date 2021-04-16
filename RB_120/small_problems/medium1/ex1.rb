# RB120-RB129 OOP Small Problems
# Medium 1 - Problem 1 : Privacy
# Sun. 12/6/20

# PROBLEM STATEMENT
=begin
Consider the following class:

class Machine
  attr_writer :switch

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

Modify this class so both flip_switch and the setter method switch= are
private methods.

Further Exploration
Add a private getter for @switch to the Machine class, and add a method to
Machine that shows how to use that getter.

=end
# CODE
class Machine

  def switch_state
    switch == :on ? "Switch is on." : "Switch is off."
  end

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_reader :switch
  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# Recall that in Ruby 2.7 and higher, it is okay to call self on a private
# instance method.

machine = Machine.new
machine.start
# p machine.switch # => :on
machine.stop
# p machine.switch # => :off

# Further exploration
p machine.switch_state