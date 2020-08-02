# More Stuff Chapter, Exercise 5
# 7/19/20 

# Why does the following code...

def execute(block)
  block.call
end 

execute { puts "Hello from inside the execute method!"}

# Give use the following error when we run it?
# block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
# from test.rb:5:in `<main>'


# It outputs an Argument Error because the execute method thinks
# block is an argument and not a block. The & is missing in front of block. 
# Therefore, using a block instead of an argument in () is confusing to the method, 
# since it's expecting an argument.

# LS Soluion
# The method parameter block is missing the ampersand sign (&)
# that allows a block to be passed as a parameter. 