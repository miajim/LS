# LS Ruby Basics Exercise - Loops 2: Greeting
# 7/30/20 

# def greeting
#   puts 'Hello!'
# end

# number_of_greetings = 2

# while number_of_greetings > 0 
# 	greeting
# 	number_of_greetings -= 1
# end

def greeting(num = 1)
	num = num.to_i
  num.times {puts 'Hello!'}
end

greeting(2)
greeting