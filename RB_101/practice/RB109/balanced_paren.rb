# Example 2 from Live Session: Beginning Ruby Part 5
# Tues. 10/20/20

=begin
Write a method that takes a string, and returns a boolean indicating whether this
string has a balanced set of parentheses.

p balancer("hi") == true
p balancer("(hi") == false
p balancer("(hi)") == true

Bonus: p balancer(")hi(") == false

input: one string, could contain several words
output: boolean - T or F

ALGO
- "balanced" == number of "(" equals number of ")"
- For bonus:
  - should still check if the number of parenthesis are equal
  - determine the index of ")" and "("
  - if the index of ")" is > the index of "(", the parenthesis are balanced
- Extra bonus (account for multiple parenthesis)
  - use a boolean to keept track of pairs
  - iterate through the characters in the string
  - if character == "(" set comparison character to ")"
  - if character == ")" set boolean to true, set comparison character to "("
=end

# def balancer(str)
#   str.count("(") == str.count(")")
# end

# Bonus
# def balancer(str)
#   return false unless (str.count("(") == str.count(")"))
#   str.count("(") == 0 ? true : str.index("(") < str.index(")")
# end

# Extra Bonus
=begin
ALGO
- LHS = "(", RHS = ")"
- guard clause 1: return false if the paren count isn't equal
- guard clause 2: return true if the paren count is equal to 0
- iterate through the string
  - check if any character is equal to the LHS
  - if yes, then continue and check if subsequent characters are equal to RHS
  - if LHS && RHS are found, increment the number of pairs found
  - return true if # of pairs > 0, otherwise return false
=end

def balancer(str)
  lhs_count = str.count("(")
  rhs_count = str.count(")")

  return false unless lhs_count == rhs_count
  return true if lhs_count == 0

  paren = "("
  act_pairs = 0
  num_pairs = (lhs_count + rhs_count) / 2

  str.each_char do |char|
    if char == paren
      paren == "(" ? (paren = ")") : (paren = "(")
      act_pairs += 1 if char == ")"
    end
  end

  act_pairs == num_pairs
end


# Conrad's (LS) solution
# def balancer(str)
#   return false unless str.count("(") == str.count(")")
#   paren_count = 0

#   str.split("").each do |char|
#     paren_count += 1 if char == "("
#     paren_count -= 1 if char == ")"
#     return false if paren_count < 0
#   end
#   true
# end

p balancer("hi") == true
p balancer("(hi") == false
p balancer("(hi)") == true
p balancer(")hi(") == false
p balancer(")hi()") == false
p balancer("()(hi)") == true
p balancer(")(hi()") == false
p balancer("(()) )(") == false