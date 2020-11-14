# First Attempt: Mon. 10/05/20

def accum(s)
	s.chars.map.with_index { |char, i| char.upcase + char.downcase * i }.join('-')
end

=begin
UNDERSTAND THE PROBLEM
- Have an input string of undetermined length
- Return a new string with each character of the string
  - capitalized
  - multiplied by it's position in the string
  - separated by other character groups with a -

ALGORITHM
- for each character in the string, create a new string
- the new string starts with a capitalized letter of the character
- the total number of characters corresponds to the position of the character in the original string
- subsequent characters are lowercase
- do this for each character in the string
- join the substring with '-'
=end
