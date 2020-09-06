# RB101-RB109 Lesson 3
# Practice Poblems - Easy 2: Question 8
# Friday. 09/04/2020

=begin
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Questions
Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."
...remove everything starting from "house".

Review the String#slice! documentation, and use that method to make the return
value "Few things in life are as important as ".
But leave the advice variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the String#slice method instead?

=end
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.slice!(0..38)
# p advice

# Bonus
# If the non-destructive #slice method is used, the original string in advice
# will remain the same but the new string will still be returned.
p first_half = advice.slice(0..38)
p advice.sub!(first_half, '')

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# advice.slice!(0, advice.index('house'))


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes
# String#index returns the starting index of the string as the argument