# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Medium 1 - Problem 5: Passing Parameters Part 3
# Fri. 01/08/2021

=begin
Given this code:
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:
# ----------------------------------
1)
gather(items) do | , |
  puts
  puts
end

Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!

# ----------------------------------

2)
gather(items) do | , , |
  puts
  puts
  puts
end

Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!

# ----------------------------------

3)
gather(items) do | , |
  puts
  puts
end

Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!

# ----------------------------------

4)
gather(items) do | , , , |
  puts
end

Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1)
# gather(items) do |*produce, grain|
#   puts "#{produce.join(", ")}"
#   puts "#{grain}"
# end

# 2)
# gather(items) do |fruit, *veggies, grain|
#   puts "#{fruit}"
#   puts "#{veggies.join(",")}"
#   puts "#{grain}"
# end

# 3)
# gather(items) do |fruit, *everything_else|
#   puts "#{fruit}"
#   puts "#{everything_else.join(", ")}"
# end

# 4)
gather(items) do |produce1, produce2, produce3, produce4|
  puts "#{produce1}, #{produce2}, #{produce3}, #{produce4}"
end

# Further Exploration
=begin

=end