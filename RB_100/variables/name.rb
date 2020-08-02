# Variables Chapter, Exercises 1, 3, 4
# 7/11/20 

=begin
Exercise 1
Write a program called name.rb that asks the user to type in their name and 
then prints out a greeting message with their name included.

Exercise 3
Add another section onto name.rb that prints the name of the user 10 times. 
You must do this without explicitly writing the puts method 10 times in a row. 
Hint: you can use the times method to do something repeatedly.

Exercise 4
Modify name.rb again so that it first asks the user for their first name, 
saves it into a variable, and then does the same for the last name. 
Then outputs their full name all at once.
=end

# Exercises 1 & 4
print "Type in your first name: "
first_name = gets.chomp

print "Type in your last name: "
last_name = gets.chomp

puts "Hello #{first_name} #{last_name}!"

# Exercise 3
10.times{puts first_name}
