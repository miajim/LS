# LS Ruby Basics Exercise - Loops 2: Get the Sum
# 7/30/20 

# loop do
# 	puts 'What does 2 + 2 equal?'
# 	answer = gets.chomp.to_i
# 	break if answer == 4 
# 	"Wrong answer. Try again!"
# end
# puts "That's correct!"

# loop do
# 	puts 'What does 2 + 2 equal?' 
# 	answer = gets.chomp.to_i
# 	puts answer == 4? "That's correct!" : "Wrong answer. Try again!"
# 	break if answer == 4
# end

loop do
	puts 'What does 2 + 2 equal?'
		if gets.to_i == 4
			puts "That's correct!"
			break
		end
		puts 'Wrong answer. Try again!'
end