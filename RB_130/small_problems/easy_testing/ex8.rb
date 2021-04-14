# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy Testing - Problem 8: Kind Assertions
# Fri. 01/08/2021

=begin
Write a minitest assertion that will fail if the class of value is not Numeric
or one of Numeric's subclasses (e.g., Integer, Float, etc).
=end

assert_kind_of(Numeric, value)


# Notes
=begin
- uses Object#kind_of?
=end