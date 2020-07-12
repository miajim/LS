# Variables Chapter, Exercise 5
# 7/11/20 

=begin
Look at the following programs...

x = 0
3.times do
  x += 1
end
puts x
and...

y = 0
3.times do
  y += 1
  x = y
end
puts x
What does x print to the screen in each case? Do they both give errors? Are the errors different? Why?

My answer: 
Program 1 will output x = 3 and Program 2 will output an error. 
Since x is initialized/instantiated within the block right after the .times method in Program 2 (inner scope), 
it will not be recognized outside of the method (outer scope) and thus will create an error.

=end