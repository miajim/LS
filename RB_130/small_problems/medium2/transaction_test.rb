require 'minitest/autorun'
# require 'minitest/reporters'

# Minitest::Reporters.use!
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(30)
  end

  def test_prompt_for_payment
    input = StringIO.new("20\n 30\n")
    item_cost = @transaction.item_cost

    # check that the method call outputs "You owe $#{item_cost}.\nHow much are you paying?"
    msg = <<~MSG
      You owe $#{item_cost}.
      How much are you paying?
      That is not the correct amount. Please make sure to pay the full cost.
      You owe $#{item_cost}.
      How much are you paying?
    MSG

    assert_output(msg) { @transaction.prompt_for_payment(input: input) }

    assert_equal(30, @transaction.amount_paid)
  end
end