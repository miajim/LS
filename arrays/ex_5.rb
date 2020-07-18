# Arrays Chapter, Exercise 5
# 7/16/20 

# What is the value of a, b, and c in the following program?

string = "Welcome to America!"
a = string[6]   # "e"
b = string[11]    # "A"
c = string[19]    # nil, no character 19. "!" is the last character at position 18

# From LS Ruby textbook: "Notice that when you reference an index of a string that is beyond the length of the string
# Ruby returns nil and doesn't throw an error."

# Recall that it is possible to use negative indices (take the current positive index minus the length of the string). 
# d = string[-1] <-- same as string[18] or "!"
# e = string[-19] <-- same as string[0] or "W"
# f = string[-20] <-- returns nil, "out of bounds"