# Methods Chapter, Exercise 5
# 7/12/20 

=begin

1) Edit the method definition in exercise #4 so that it does print words on the screen.
2) What does it return now?

=end

def scream(words)
  words = words + "!!!!"
  return words
end

# outputs Yippeee!!!! to the console, returns the same
puts scream("Yippeee")