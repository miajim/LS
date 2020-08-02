# LS Ruby Basics Exercise - Opposites Attract
# 7/30/20

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

int_1 = nil
int_2 = nil

loop do
  loop do
    puts ">> Please enter a positive or negative integer: "
    int_1 = gets.chomp
    break if valid_number?(int_1)
    puts ">> Invalid input. Only non-zero integers are allowed." unless valid_number?(int_1)
  end
  
  loop do
    puts ">> Please enter a positive or negative integer: "
    int_2 = gets.chomp
    break if valid_number?(int_2)
    puts ">> Invalid input. Only non-zero integers are allowed." unless valid_number?(int_2)
  end
  
  pos_neg_check  = (int_1.to_i <=> 0) + (int_2.to_i <=> 0)
  break if  pos_neg_check == 0
   
  if pos_neg_check != 0 
    puts ">> Sorry. One integer must be positive, one must be negative. " \
    "Please start over."
  end
end

 puts "#{int_1} + #{int_2} = #{int_1.to_i + int_2.to_i}"