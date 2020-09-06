# RB101-RB109 Lesson 3
# Practice Poblems - Easy 2: Question 7
# Friday. 09/04/2020

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Questions
Question 7
In the previous practice problem we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
We could have used either Array#concat or Array#push to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)
=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones << "Dino" << "Hoppy"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.push("Dino", "Hoppy")

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.concat(["Dino", "Hoppy"])


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain
or
flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
Both Array#push and Array#concat take multiple arguments.
Notice the argument for concat is an array, returns a "flattened" 1D array
after concatentation.


=end