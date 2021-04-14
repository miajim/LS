# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy Testing - Problem 9: Same Object Assertions
# Fri. 01/08/2021

=begin
Write a test that will fail if list and the return value of list.process are
different objects.

=end

assert_same(list, list.process)

# Notes
=begin
- uses #equal?
=end