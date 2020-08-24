# RB101 - Lesson 1: Good vs. Bad Questions
# 8/2/20 

NUMBERS = [1, 2, 3]
arr = [1, 2, 3]

def test 
  puts NUMBERS.inspect  # => [1, 2, 3]
  puts arr.inspect # => NameError: undefined local variable or method 'arr'
end

test

=begin
Side note: the reason that the test method can access the constant but not the local variable 
is because local variables and constants have different scoping rules; we'll talk about that more in the later lessons.
=end