require 'minitest/autorun'
# require "minitest/reporters"

# Minitest::Reporters.use!

require_relative 'cat'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty', 1)
  end

  def test_is_cat; end

  # def test_name
  #   assert_equal('Milo', @kitty.name)
  # end

  def test_miaow
    assert_match(/ is miaowing\./, @kitty.miaow)
  end

  def test_raises_error
    begin
      Cat.new("Katie", 2)
    rescue ArgumentError => e
    end
    assert_equal(ArgumentError, e.class)
  end

  # def test_is_not_purrier
  #   patch = Cat.new('Patch', 5)
  #   milo = Cat.new('Milo', 3)

  #   refute(patch.purr_factor > milo.purr_factor)
  # end
end