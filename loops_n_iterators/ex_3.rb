# Loops & Iterators Chapter, Exercise 3
# 7/14/20 

# Write a method that counts down to zero using recursion

def countdown(n)
  if n == 0
    puts n 
  else
    puts n
    countdown(n-1)
  end
end

countdown(5)

# Note that a negative argument would create a stack overflow!