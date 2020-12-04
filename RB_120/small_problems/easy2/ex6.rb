# RB120-RB129 OOP Small Problems
# Easy 2 - Problem 6 : Comparing Wallets
# Wed. 11/18/20

# PROBLEM STATEMENT
=begin
Consider the following broken code:

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

Modify this code so it works. Do not make the amount in the wallet accessible
to any method that isn't part of the Wallet class.

Further Exploration
This example is rather contrived and unrealistic, but this type of situation
occurs frequently in applications. Can you think of any applications where
protected methods would be desirable?

=end
# CODE

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected
  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)

if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

=begin
Further Exploration

My understanding is that protected methods cannot be directly invoked outside
of a class definition, but they are accessible via instance methods that
can call the protected methods for objects of the given class (even inherited
objects).

This functionality could be helpful in a similar situation, but perhaps for
an individual's accounts. A method for comparing an individual's current credit
card balance to their maximum allowable line of credit.
=end