# LS Ruby Basics Exercise - Loops 2: First to Five
# 7/30/20 

number_a = 0
number_b = 0

loop do
	if (number_a >= 5) || (number_b >= 5)
		puts "5 was reached!"
	  break
	else
	  number_a += rand(2)
	  number_b += rand(2)
	end
end

puts number_a
puts number_b