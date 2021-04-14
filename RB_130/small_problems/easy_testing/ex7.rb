# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy Testing - Problem 1: Boolean Assertions
# Fri. 01/08/2021

=begin
Write a minitest assertion that will fail if value is not an instance of the
Numeric class exactly. value may not be an instance of one of Numeric's superclasses.
=end

assert_instance_of(Numeric, value)

# Notes
=begin
- uses Object#instance_of?
=end