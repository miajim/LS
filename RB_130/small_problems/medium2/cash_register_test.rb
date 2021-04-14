require 'minitest/autorun'
# require 'minitest/reporters'

# Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(20)
  end

  def test_accept_money
    # confirm that the argument passed to the method is a transaction object
    @transaction.amount_paid = 20
    assert_instance_of(Transaction, @transaction)
    # check that the total money in the register is the exisiting amount plus
    # the amount deposited
    starting_amount = @register.total_money
    @register.accept_money(@transaction)
    assert_equal(starting_amount + 20, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 50
    assert_equal(30, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $20.\n") { @register.give_receipt(@transaction) }
  end
end
