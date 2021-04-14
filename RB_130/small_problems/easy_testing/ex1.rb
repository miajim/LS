# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy Testing - Problem 1: Boolean Assertions
# Fri. 01/08/2021

=begin
Write a minitest assertion that will fail if the value.odd? is not true.

=end

assert(value.odd?)

# Notes
=begin
- assert can take an optional error message, useful for providing context if
  the test fails
- better to use assert_equal to ensure the method returns true and not just
  a truthy value
=end