# RB101 - Lesson 1: Good vs. Bad Questions
# 8/2/20

NUMBERS = [1, 2, 3]  # constants (recognized by all caps in Ruby) defined outside of a method are accessible inside the method
numbers2 = [4, 5, 6] # local variables, however are not

def test
  puts NUMBERS.inspect
  puts numbers2.inspect
end

test
