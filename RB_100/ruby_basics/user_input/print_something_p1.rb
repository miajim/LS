# LS Ruby Basics Exercise - User Input: Print Something (Part 1)
# 7/30/20 

puts "Do you want me to print something? (y/n)"
input = gets.chomp.downcase
puts "something" if input == "y"
