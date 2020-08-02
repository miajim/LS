# Methods Chapter, Exercise 4
# 7/12/20 

=begin

What will the following code print to the screen? 

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")

Nothing will be printed to the screen and the code will return nil. 

=end

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")