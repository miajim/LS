# Basics Chapter, Exercise 3
# 7/11/20 

=begin
(a) Write a program that uses a hash to store a list of movie titles with the year they came out. 
(b) Then use the puts command to make your program print out the year of each movie to the screen. 
=end 

# (a)
movie_hash = {
  the_godfather: 1975, 
  casablanca: 1942,
  citizen_kane: 1941,
  pulp_fiction: 1994,
  psycho: 1960
}

# (b)
movie_hash.each { |movie, year| puts year }