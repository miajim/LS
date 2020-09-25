# RB101-RB109 Small Problems
# Easy 7 - Problem 6: Staggered Caps (Part 2)
# Fri. 09/25/20

# PROBLEM STATEMENT
=begin
Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each letter.
The non-alphabetic characters should still be included in the return value;
they just don't count when toggling the desired case.

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

Further Exploration
Modify this method so the caller can determine whether non-alphabetic characters
should be counted when determining the upper/lowercase state. That is, you want
a method that can perform the same actions that this method does,
or operates like the previous version.

Hint: Use a keyword argument.
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

# CODE
# def staggered_case(str)
#   new_str = ""
#   upcase = true
#   str.chars.each do |char|
#     if char =~ /[a-z]/i
#       upcase ? new_str << char.upcase : new_str << char.downcase
#       upcase = !upcase
#     else
#       new_str << char
#     end
#   end
#   new_str
# end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# # Further Exploration
# def staggered_case_all(str) # from previous exercise, ex5
#   new_str = ""
#   str.chars.each_with_index do |char, i|
#     i % 2 == 0 ? new_str << char.upcase : new_str << char.downcase
#   end
#   new_str
# end

# def staggered_case(str, consider_all_chars = false)
#   if consider_all_chars
#     staggered_case_all(str)
#   else
#     new_str = ""
#     upcase = true
#     str.chars.each do |char|
#       if char =~ /[a-z]/i
#         upcase ? new_str << char.upcase : new_str << char.downcase
#         upcase = !upcase
#       else
#         new_str << char
#       end
#     end
#     new_str
#   end
# end

# Alternatively, and more succinctly:
def staggered_case(str, consider_all_chars = false)
  new_str = ""
  upcase = true
  str.chars.each do |char|
    if char =~ /[a-z]/i
      upcase ? new_str << char.upcase : new_str << char.downcase
      upcase = !upcase
    else
      new_str << char
      consider_all_chars ? upcase = !upcase : upcase = upcase
    end
  end
  new_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', true) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'