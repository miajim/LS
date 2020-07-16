# Flow Control Chapter, Exercise 3
# 7/13/20 

=begin
Write a program that takes a number from the user between 0 and 100 
and reports back whether the number is between 0 and 50, 51 and 100, or above 100.
=end

print "Input a number between 0 and 100: "
num = gets.chomp.to_i
if (num >= 0) && (num <= 50)
  puts "Number is between 0 and 50."
elsif (num >= 51) && (num <=100)
  puts "Number is between 51 and 100."
elsif (num > 100)
  puts "Number is greater than 100."
else
  puts "Number is less than 0."
end