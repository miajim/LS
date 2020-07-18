# Arrays Chapter, Exercise 6
# 7/17/20 

# You run the folowing code...
# names = ['bob', 'joe', 'susan', 'margaret']
# names['margaret'] = 'jody'
# ...and get the following error message: 
# TypeError: no implicit conversion of String into Integer
  # from (irb):2:in `[]='
  # from (irb):2
  # from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'

# What is the problem and how can it be fixed?

# The problem is that [] doesn't take a string as an argument. 
# It only recognizes an integer. 
# To replace 'margaret' with 'jody', you have to pass the index of 'margaret' to []

# names = ['bob', 'joe', 'susan', 'margaret']
# names[3] = 'jody'

# or

# names = ['bob', 'joe', 'susan', 'margaret']
# names['3'.to_i] = 'jody'

# Works as long as the string is converted to an integer.