# LS Ruby Basics Exercise - User Input: Launch School Printer (Part 1)
# 7/30/20 

num_output = 0

loop do
  print ">> How many output lines do you want? Enter a number >= 3: "
  num_output = gets.chomp.to_i
  break if num_output >= 3
  puts "That's not enough lines."
end 

num_output.times { puts "Launch School is the best!" }
