# More Stuff Chapter, Exercise 4
# 7/19/20 

# Modify the code in exercise 2 to make the block execute properly.

def execute(&block)
  block.call  # <-- Added the .call method to execute the block
end

execute { puts "Hello from inside the execute method!" }