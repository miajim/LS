# RB101-RB109 Lesson 4
# Practice Problems: Additional Practice - Practice Problem 7
# Thurs. 09/10/20

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
ex:

{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
statement = "The Flintstones Rock"
statement_arr = statement.chars
statement_arr.delete(" ")

statement_hash = statement_arr.each_with_object({}) do |char, hash|
  if hash.key?(char)
    hash[char] += 1
  else
    hash[char] = 1
  end
end

p statement_hash


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
=begin

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

=end