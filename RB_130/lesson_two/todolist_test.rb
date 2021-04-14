require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"

Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
    assert_equal(3, @list.to_a.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    # return first item in list
    assert_equal(@todo1, @list.shift)
    # remove last item from list
    assert_equal(@todos[1, 2], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(@todos[0, 2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add("hi") }
    # assert_raises(TypeError) { @list.add(test other data types here) }
  end

  def test_shovel
    @list << Todo.new("Complete problem set")
    assert_instance_of(Todo, @list.last)
    assert_equal(4, @list.size)
  end

  def test_add # and <<
    todo = Todo.new("Complete problem set")
    assert_equal(@todos << todo, @list.add(todo))
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(3) }
    assert_raises(IndexError) {@list.item_at(-10) }
  end

  def test_mark_done_at
    list_done = @list.mark_done_at(2)
    assert_equal(@todos[2].done?, list_done)
    # assert_equal(false, @todo1.done?)
    # assert_equal(false, @todo2.done?)
    # assert_equal(true, @todo3.done?)
    assert_raises(IndexError) { @list.mark_done_at(3) }
  end

  def test_mark_undone_at
    @todo2.done!
    assert_equal(false, @list.mark_undone_at(1))
    assert_raises(IndexError) { @list.mark_done_at(3) }
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(3) }
    assert_equal(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s_1
    output = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    @list.mark_done_at(1)

    output = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    @list.done!

    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each_iterating
    each_act = []
    @list.each { |todo| each_act << todo }
    each_exp = @todos

    assert_equal(each_exp, each_act)
  end

  def test_each_original_obj
    each_exp = @list
    each_act = @list.each { |todo| todo }

    assert_same(each_exp, each_act)
  end

  def test_select
    @list.mark_done_at(0)
    select_act = @list.select { |todo| todo.done? }
    select_exp = TodoList.new("Today's Todos")
    select_exp.add(@todo1)

    assert_equal(select_exp.title, select_act.title)
    assert_equal(select_exp.to_a, select_act.to_a)
  end

  def test_find_by_title
    title = @list.find_by_title("Clean room")
    assert_equal(@todo2, title)
  end

  def test_all_done
    @list.done!

    @todo1.done!
    @todo2.done!
    @todo3.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
    list.add(@todo2)
    list.add(@todo3)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.all_done.to_s)
  end

  def test_all_not_done
    list = TodoList.new(@list.title)
    list.add(@todo1)
    list.add(@todo2)
    list.add(@todo3)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.all_not_done.to_s)
  end

  def test_mark_done
    @list.mark_done("Go to gym")
    assert_equal([@todo3], @list.all_done.to_a)

    assert_raises(NoMethodError) { @list.mark_done("Get a haircut") }
  end

  def test_mark_all_done
    list = TodoList.new(@list.title)
    list.add(@todo1)
    list.add(@todo2)
    list.add(@todo3)
    list.done!

    assert_equal(list.to_a, @list.mark_all_done.to_a)
  end

  def test_mark_all_undone
    @list.mark_done_at(1)
    assert_equal(@todos, @list.mark_all_undone.to_a)
  end
end