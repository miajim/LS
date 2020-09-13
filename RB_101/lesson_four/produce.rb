# RB101-RB109 Lesson 4
# Selection and Transformation: Produce Example
# Thurs. 09/10/20

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  selected_fruit = {}
  count = 0
  loop do
    break if count == produce.length # Must be at the beginning in case the input hash is empty
    if produce[produce.keys[count]] == 'Fruit'
      selected_fruit[produce.keys[count]] = 'Fruit'
    end
    count += 1
  end
  selected_fruit
end

p select_fruit(produce)