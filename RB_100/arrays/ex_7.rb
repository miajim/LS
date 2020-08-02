# Arrays Chapter, Exercise 7
# 7/17/20 

# Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

weasleys = [ "Bill", "Charlie", "Percy", "Fred", "George", "Ron", "Ginny"]
weasleys.each_with_index { |name, index| puts "#{index+1}: #{name}" }
