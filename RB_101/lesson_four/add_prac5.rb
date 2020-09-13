# RB101-RB109 Lesson 4
# Practice Problems: Additional Practice - Practice Problem 5
# Thurs. 09/10/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
Find the index of the first name that starts with "Be"

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Option 1
flintstones.each_with_index do |name, index|
  if name.start_with?("Be")
    puts index
    break
  end
end

# Option 2
flintstones.each {|name| puts flintstones.index(name) if name.start_with?("Be") }

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
flintstones.index { |name| name[0, 2] == "Be" }
=begin

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

=end