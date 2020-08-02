# LS Ruby Basics Exercise - User Input: Username and Password
# 7/30/20 


USERNAME = "admin"
PASSWORD = "SecreT"

loop do
	puts ">> Please enter your username: "
	input_username = gets.chomp
	puts ">> Please enter your password: "
	input_password = gets.chomp
	break if (input_username == USERNAME) && (input_password == PASSWORD)
	puts ">> Authorization failed!"
end

puts "Welcome!"