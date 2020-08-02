# LS Ruby Basics Exercise - Loops 2: Insert Numbers
# 7/30/20 

# numbers = []

# loop do
# puts 'Enter any number:'
# input = gets.chomp.to_i
# numbers.length == 5? break : numbers << input
# end

# puts numbers

numbers = []

loop do
puts 'Enter any number:'
input = gets.chomp.to_i
numbers << input
break if numbers.length == 5
end

puts numbers