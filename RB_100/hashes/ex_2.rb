# Hashes Chapter, Exercise 2
# 7/18/20 

=begin
Look at Ruby's merge method. 
Notice that it has two versions. 
What is the difference between merge and merge!? 
Write a program that uses both and illustrate the differences.
=end

h1 = { a: 1, b: 2, c: 3}
h2 = { a: 3, d: 5}
h3 = { a: 4, b: 7, e: 9}

p h1.merge(h2, h3) # non-destructive method
p h1 # returns original h1 array

p h1.merge!(h2, h3) # replaces h1 with new array
p h1
