=begin

Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.
"abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""

# Notes
Inputs
  - one string with chars
Outputs
  - one string (paired down from the original string)
Rules/Req's
  - a "#" represents a backspace (deletes the char in front of it)
  -
  -
Questions
  - Should we mutate the original string or return a new string?
  -
Algorithm
  - set a variable equal to an empty string to track chars
  - iterate over the input string (chars)
  - if the character is not a #, append to the "tracking" string
  - otherwise the character is a #, delete the last character from the tracking string
  - return the tracking string after iteration
=end

# def clean_string(string)
#   clean_str = []
#   string.chars.each do |char|
#     if char == "#"
#       clean_str.delete_at(-1)
#     else
#       clean_str << char
#     end
#   end
#   clean_str.join("")
# end

# # Refactored
# def clean_string(string)
#   string.chars.each_with_object([]) do |char, clean_str|
#     char == "#" ? clean_str.delete_at(-1) : clean_str << char
#   end.join("")
# end

# If we wanted to mutate the input string and return it
def clean_string(string)
  i_to_delete = []
  num_chars = 0
  num_removed = 0
  string.chars.each_with_index do |char, i|
    if char == "#"
      num_chars += 1
      i_to_delete << (i - num_chars - num_removed)
      num_removed += 1
    end
  end
  string.delete!("#")
  i_to_delete.each { |i| string.slice!(i) }
  string
end


p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
