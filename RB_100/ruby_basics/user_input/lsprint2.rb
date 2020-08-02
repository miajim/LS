# LS Ruby Basics Exercise - Launch School Printer (Part 2)
# 7/30/20

num_output = 0

loop do
  print ">> How many output lines do you want? Enter a number >= 3 (Q to quit): "
  num_output = gets.chomp
	break if num_output.downcase == 'q'
  if num_output.to_i < 3
	  puts "That's not enough lines."
	else
    num_output.to_i.times { puts "Launch School is the best!" }
	end
end 

