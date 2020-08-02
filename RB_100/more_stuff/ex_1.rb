# More Stuff Chapter, Exercise 1
# 7/19/20 

# Write a program that checks if the sequence of characters "lab" exists in the following strings. 
# If it does exist, print out the word.

# laboratory, experiment, Pans Labyrinth, elaborate, polar bear

def check_lab(word)
  if word =~ /lab/
    puts word
  else
    puts "'lab' does not exist!"
  end
end

check_lab("laboratory")
check_lab("experiment")
check_lab("Pans Labyrinth")
check_lab("elaborate")
check_lab("polar bear")