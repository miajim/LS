# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 14
# Mon. 09/21/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
Given this data structure write some code to return an array containing the
colors of the fruits and the sizes of the vegetables. The sizes should be uppercase
and the colors should be capitalized. The return value should look like this:
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# for the values in the hash object,
  # if the type key has a value of fruit
    # return the values assoc. with color (capitalize each element in the value)
  # else (it has a value of vegetable)
    # return the value assoc. with size (upcase the element)

# Original solution
# subhash_ary = hsh.values
# output = subhash_ary.map do |subhash|
#   if subhash[:type] == 'fruit'
#     subhash[:colors].map(&:capitalize)
#   elsif subhash[:type] == 'vegetable'
#     subhash[:size].upcase
#   end
# end

# Slightly refactored (as a case statement)
output = hsh.values.map do |subhash|
  case subhash[:type]
  when 'fruit' then subhash[:colors].map(&:capitalize)
  when 'vegetable' then subhash[:size].upcase
  end
end

p output == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin

=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
