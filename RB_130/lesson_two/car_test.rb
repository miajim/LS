require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!
# returns to the default implementation of reporting results
# Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => false)]

require_relative 'car'

class CarTest < MiniTest::Test # test suite
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  # def test_bad_wheels
  #   car = Car.new
  #   assert_equal(3, car.wheels)
  # end

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_name_is_nil # test case / test
    car = Car.new
    assert_nil(car.name) # test step / test / assertion
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey")
    end
  end

  def test_refute_instance_of
    # skip
    car = Car.new
    refute_instance_of(Integer, car)
  end

  def test_assert_includes
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end
end