# # RB101-RB109 Lesson 4
# # Selection and Transformation: Double Numbers Example
# # Thurs. 09/10/20

# def double_numbers(numbers)
#   # doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     # current_number = numbers[counter]
#     # doubled_numbers << current_number * 2
#     numbers[counter] *= 2

#     counter += 1
#   end

#   p numbers
#   p numbers.object_id
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p my_numbers.object_id
# double_numbers(my_numbers)
# p my_numbers

# def double_odd_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     doubled_numbers << current_number

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# # not mutated
# p


def multiply(numbers, times)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= times
    multiplied_numbers << current_number

    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]