# # LS Ruby Basics Exercise - User Input: Dividing Numbers
# # 7/30/20 

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end

# numerator = nil
# denominator = nil 

# loop do
# puts ">> Please enter the numerator: "
# numerator = gets.chomp
# break if valid_number?(numerator)
# puts "Invalid input. Only integers are allowed." 
# end 

# loop do 
# puts ">> Please enter the denominator: "
# denominator = gets.chomp

# if valid_number?(denominator) && denominator != "0"
# 	break
# elsif denominator == "0"
# 	puts "Invalid input. A denominator of 0 is not allowed."
# else 
# 	puts "Invalid input. Only integers are allowed." 
# end
# end
# puts ">> #{numerator} / #{denominator} is #{numerator.to_i/denominator.to_i}"

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil 

loop do
  puts ">> Please enter the numerator: "
  numerator = gets.chomp
  unless valid_number?(numerator)
  	puts "Invalid input. Only integers are allowed." 
  	next
  else
  	loop do
  	puts ">> Please enter the denominator: "
  	denominator = gets.chomp
  		if valid_number?(denominator) && denominator != "0"
  		break
  		elsif denominator == "0"
  		puts "Invalid input. A denominator of 0 is not allowed."
  		else 
  		puts "Invalid input. Only integers are allowed." 
  		end
  	end
  end
  break
end 

puts ">> #{numerator} / #{denominator} is #{numerator.to_i/denominator.to_i}"
