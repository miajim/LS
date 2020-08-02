# More Stuff Chapter, Exercise 2
# 7/19/20 

# What will the following program print to the screen?
# What will it return? 
def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }


# My intial answer (incorrect)
# prints: "Hello from inside the execute method!"
# returns: nil (puts returns nil)

# Running the file/ then using irb
# Nothing is printed to screen, appears to return a proc

# LS answer
# Nothing is printed to the screen because the block is never
# activated with the .call method. The method returns a Proc

# If .call were added to the block, my initial answer would be correct.