# RB101-RB109 Small Problems
# Documentation Again - Problem 5: Multiple Signatures
# Mon. 08/24/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question

# What do each of these puts statements output? 
a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) {|index| index**2}

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# a = ['a', 'b', 'c', 'd', 'e']
# puts a.fetch(7) --> throws an IndexError exception since the referenced index lies outside of the array bounds. 
# puts a.fetch(7, 'beats me') --> prints 'beats me' since there is no index 7, but a default value is supplied
# puts a.fetch(7){|index| index**2} --> block is executed when an invalid index is referenced, therefore in this case will return 49 (7^2)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Note: having multiple lines in the signature is another way in which the ruby documentation indicates that an argument is optional. 
# fetch does bounds checking (unline Array#[]); it checks that the specified element exists before fetching it and raises an error if it does not exist  

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# Literals: http://ruby-doc.org/core-2.6.3/doc/syntax/literals_rdoc.html
# See Percent Strings 
# Array#fetch: http://ruby-doc.org/core-2.6.3/Array.html#fetch-method
# Array#fetch signature: fetch(index) --> obj // fetch(index, default)  --> obj // fetch(index){|index| block} --> obj
