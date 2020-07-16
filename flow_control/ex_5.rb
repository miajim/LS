# Flow Control Chapter, Exercise 5
# 7/13/20 

# When you run the following code...
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end
end

equal_to_four(5)

# You get the following error message...
# exercise.rb:8: syntax error, unexpected end-of-input, expecting keyword_end

# Why do you get this error and how can you fix it?
# The if-else statement is missing an "end". 