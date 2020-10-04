# RB101-RB109 Small Problems
# Easy 9 - Problem 1: Welcome Stranger
# Sat. 09/26/20

# PROBLEM STATEMENT
=begin
Create a method that takes 2 arguments, an array and a hash. The array will
contain 2 or more elements that, when combined with adjoining spaces, will
produce a person's name. The hash will contain two keys, :title and :occupation,
and the appropriate values. Your method should return a greeting that uses the
person's full name, and mentions the person's title and occupation.

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.

Further Exploration
This method doesn't actually pass rubocop! What is the best way to shorten
the lines in this method so it doesn't exceed the 80 maximum characters to a line?
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    -
  Outputs
    -
Rules/Implicit Requirements
  -
  -
  -
Clarifying Questions
  -
Mental Model (optional)
  -

EXAMPLES/TEST CASES

DATA STRUCTURE
  Inputs
    -
  Rules
    -

ALGORITHM
  -
=end

def greetings(arr, hsh)
  puts "Hello, #{arr.join(" ")}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Further Exploration
def greetings(arr, hsh)
  print "Hello, #{arr.join(" ")}! Nice to have a "
  puts "#{hsh[:title]} #{hsh[:occupation]} around."
end

def greetings(arr, hsh)
  puts "Hello, #{arr.join(" ")}! Nice to have a " +
  "#{hsh[:title]} #{hsh[:occupation]} around."
end

def greetings(arr, hsh)
  name = arr.join(" ")
  job = "#{hsh[:title]} #{hsh[:occupation]}"
  puts "Hello, #{name}! Nice to have a #{job} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.