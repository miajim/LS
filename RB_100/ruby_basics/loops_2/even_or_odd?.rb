# An alternative (refactored) solution to the Loops 2: Even or Odd? exercise in the Ruby Basics problem set.
# Uses #times and a ternary conditional expression to efficiently provide a solution.

# Write a loop that prints numbers 1-5 and whether the number is even or odd.

5.times do |count|   
	count += 1      # Recall that times starts counting at zero, so must add 1 to output numbers 1-5
	puts count.even?? "#{count} is even!" : "#{count} is odd!"
end