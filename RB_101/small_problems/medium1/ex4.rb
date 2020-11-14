# RB101-RB109 Small Problems
# Medium 1 - Problem 4: 1000 Lights
# Sun. 10/11/20

# PROBLEM STATEMENT
=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row of
switches and toggle every one of them. You go back to the beginning, and on this
second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go
back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat
this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and
returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
PEDAC Template
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
UNDERSTAND THE PROBLEM
  Inputs
    - One integer, specifies the number of switches
  Outputs
    - One array with integer elements, switch numbers that are "on"
Rules/Implicit Requirements
  - Fourth pass: 4, 6, 8,...; Fifth pass: 5, 7, 9,...
  - Number of switches is also the number of iterations
  - Switch 1 is always on and there is always at least one switch
  - Switch n is always off
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
  - generate an array with integer elements from 1..n
  - generate another array with n 'false' boolean elements
  - create a hash from these arrays
  - iterate over the entire hash n times
  - first iteration: all lights are "on" --> change all boolean elements to true
  - 2nd iteration: change all boolean elements to their opposite value if they are even numbered, starting at 2
  - 3rd iteration: change all boolean elements to their opp. val. if they are odd numbered, starting at 3
  - nth iteration: change all boolean elements tot their opp. val. if the are ? numbered, starting at n
  - return the keys in an array for which the corresponding values are true
=end

def multiples(num, n)
  (num..n).to_a.select { |value| value % num == 0 }
end

def lights_on(n)
  nums = (1..n).to_a
  booleans = [false] * n
  switches = nums.zip(booleans).to_h

  n.times do |idx|
    multiples_arr = multiples(idx + 1, n)
    switches.each_pair { |k, v| switches[k] = !v if multiples_arr.include?(k) }
  end

  switches.select { |_, value| value == true }.keys
end

p lights_on(5)
p lights_on(10)
p lights_on(1)