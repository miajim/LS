# Flow Control Chapter, Exercise 2
# 7/13/20 

=begin
Write a method that takes a string as argument. 
The method should return a new, all-caps version of the string, 
only if the string is longer than 10 characters. Example: change "hello world" to "HELLO WORLD". 
(Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)
=end

def to_all_caps(input_string)
    input_string.length > 10? input_string.upcase : input_string
end

puts to_all_caps("hello world")
puts to_all_caps("hi")