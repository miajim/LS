# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy Testing - Problem 2: Equality Assertions
# Fri. 01/08/2021

=begin
Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
=end

assert_equal('xyz', value.downcase)

# Notes
=begin
- assert_equal tests whether the args are equal using #==
- first arg = expected value, second arg = actual value
=end