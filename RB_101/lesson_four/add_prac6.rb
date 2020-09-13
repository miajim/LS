# RB101-RB109 Lesson 4
# Practice Problems: Additional Practice - Practice Problem 6
# Thurs. 09/10/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map { |name| name = name[0, 3] }

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
flintstones.map! { |name| name[0,3] }
=begin

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

=end