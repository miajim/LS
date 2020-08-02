# LS Ruby Basics Exercise - User Input: Passwords
# 7/30/20 

PASSWORD = "SecreT"

loop do
	puts ">> Please enter your password: "
	user_input = gets.chomp
	break if user_input == PASSWORD
	puts "Invalid password!"
end

puts "Welcome!"