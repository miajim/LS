# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy Testing - Problem 1: Boolean Assertions
# Fri. 01/08/2021

=begin
Write a minitest assertion that will fail if value is not nil.
=end

assert_nil(value)

# Notes
=begin
- could also use assert_equal(nil, value) but assert_nil issues a better
  failure message
=end