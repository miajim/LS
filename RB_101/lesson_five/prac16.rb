# RB101-RB109 Lesson 5
# Practice Problems: Sorting, Nested Collections, and Working with Blocks
# Problem 16
# Tues. 09/22/20

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Question
=begin
A UUID is a type of identifier often used as a way to uniquely identify items...
which may not all be created by the same system. That is, without any form of synchronization,
two or more separate computer systems can create new items and label them with a UUID
with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible
UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into
5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# My Solution
# Algo
# create 5 separate random hexadecimal characters of lengths: 8, 4, 4, 4, 12
# join these values into a string, separated by "-"
HEXADECIMAL = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
LENGTHS = [8, 4, 4, 4, 12]

# original solution
def generate_uuid
  uuid = []
  for i in LENGTHS
    uuid << HEXADECIMAL.sample(i).join()
  end
  uuid.join("-")
end

# slightly refactored
def generate_uuid
  LENGTHS.each_with_object([]) { |length, uuid| uuid << HEXADECIMAL.sample(length).join() }.join("-")
end

p generate_uuid

require 'securerandom'
p SecureRandom.uuid
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
=begin
RFC 4122 documents how to properly generate UUIDs
=end

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Addtional Notes

order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]


customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

all_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
  {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
  # rest of data
]

fulfilled_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # rest of data
]