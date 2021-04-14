# RB130-RB139 Ruby Foundations: More Topics
# Small Problems Easy Testing - Problem 1: Boolean Assertions
# Fri. 01/08/2021

=begin
Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

=end

assert_raises(NoExperienceError) { employee.hire }
