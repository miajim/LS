# Loops & Iterators Chapter, Exercise 2
# 7/14/20 

# Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". 
# Each loop can get info from the user.

action = "Go!"

while action != "STOP"
  puts "Go!"
  action = gets.chomp
  # if action != "STOP"
  #   puts "Go!"
  # else
  #   break 
  # end
end