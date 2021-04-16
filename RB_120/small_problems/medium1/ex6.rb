# RB120-RB129 OOP Small Problems
# Medium 1 - Problem 6: Number Guesser Part 1
# Tues. 12/8/20

# PROBLEM STATEMENT
=begin
Create an object-oriented number guessing class for numbers in the range 1 to
100, with a limit of 7 guesses per game. The game should play like this:

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end
# CODE

class User
  attr_reader :guess

  def initialize
    @guess = nil
  end

  def guess_a_number_between(range)
    answer = nil
    loop do
      print "Enter a number between #{range.first} " \
            "and #{range.last}: "
      answer = gets.chomp.strip
      break if answer.to_s.to_i == answer.to_i && range === answer.to_i
      puts "Invalid guess."
    end
    @guess = answer.to_i
  end
end

class GuessingGame
  RANGE = 1..100
  ROUNDS = 7

  attr_accessor :num_guesses

  def initialize
    reset
    @user = User.new
  end

  def display_guesses_remaining
    puts "You have #{@num_guesses} guesses remaining."
  end

  def reset
    @target = Random.new.rand(RANGE)
    @num_guesses = ROUNDS
  end

  def user_guesses
    @user.guess_a_number_between(RANGE)
  end

  def compare_guess_to_target
    comparison = @user.guess <=> @target
    case comparison
    when 1 then puts "Your guess is too high."
    when 0 then puts "That's the number!"
    when -1 then puts "Your guess is too low."
    end
    puts ""
  end

  def win?
    @user.guess == @target
  end

  def display_user_loses
    puts "You have no more guesses. You lost!"
    puts "The target number was: #{@target}."
  end

  def display_user_wins
    puts "You won!"
  end

  def play
    loop do
      display_guesses_remaining
      user_guesses
      compare_guess_to_target
      self.num_guesses -= 1
      break display_user_wins if win?
      break display_user_loses if num_guesses == 0
    end
    reset
  end
end

game = GuessingGame.new
game.play
game.play