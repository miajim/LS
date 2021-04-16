# RB120-RB129 OOP Small Problems
# Medium 1 - Problem 7: Number Guesser Part 2
# Wed. 12/9/20

# PROBLEM STATEMENT
=begin
In the previous exercise, you wrote a number guessing game that determines a
secret number between 1 and 100, and gives the user 7 opportunities to guess the
number.

Update your solution to accept a low and high value when you create a
GuessingGame object, and use those values to compute a secret number for the
game. You should also change the number of guesses allowed so the user can
always win if she uses a good strategy. You can compute the number of guesses
with: Math.log2(size_of_range).to_i + 1

game = GuessingGame.new(501, 1500)
game.play

Examples:

You have 10 guesses remaining.
Enter a number between 501 and 1500: 104
Invalid guess. Enter a number between 501 and 1500: 1000
Your guess is too low.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 1250
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 1375
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 80
Invalid guess. Enter a number between 501 and 1500: 1312
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 1343
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 1359
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 1351
Your guess is too high.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 1355
That's the number!

You won!

game.play
You have 10 guesses remaining.
Enter a number between 501 and 1500: 1000
Your guess is too high.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 750
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 875
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 812
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 843
Your guess is too high.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 820
Your guess is too low.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 830
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 835
Your guess is too low.

You have 2 guesses remaining.
Enter a number between 501 and 1500: 836
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 501 and 1500: 837
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

  attr_accessor :lower, :upper, :target, :num_guesses, :user

  def initialize
    @lower = nil
    @upper = nil
    @target = nil
    @num_guesses = nil
    @user = User.new
  end

  def display_guesses_remaining
    puts "You have #{num_guesses} guesses remaining."
  end

  def reset
    system('clear')
    display_welcome_message
    # set_lower_bound
    # set_upper_bound
    set_bounds(:lower, 0)
    set_bounds(:upper, lower)
    size_of_range = upper - lower
    self.target = rand(lower..upper)
    @num_guesses = Math.log2(size_of_range).to_i + 1
  end

  def set_bounds(param, floor)
    answer = nil
    loop do
      print "Set the #{param} bound to an integer > #{floor}: "
      answer = gets.chomp.strip
      break if answer.to_i.to_s == answer && answer.to_i > floor
      puts "Invalid choice."
    end
    self.send("#{param}=", answer.to_i)
  end

  # def set_lower_bound
  #   answer = nil
  #   loop do
  #     print "Set the lower bound to an integer > 0: "
  #     answer = gets.chomp.strip
  #     break if answer.to_i.to_s == answer && answer.to_i > 0
  #     puts "Invalid choice."
  #   end
  #   self.lower = answer.to_i
  # end

  # def set_upper_bound
  #   answer = nil
  #   loop do
  #     print "Set the upper bound to an integer > the lower bound: "
  #     answer = gets.chomp.strip
  #     break if answer.to_i.to_s == answer && answer.to_i > lower
  #     puts "Invalid choice."
  #   end
  #   self.upper = answer.to_i
  # end

  def user_guesses
    user.guess_a_number_between(lower..upper)
  end

  def compare_guess_to_target
    comparison = user.guess <=> target
    case comparison
    when 1 then puts "Your guess is too high."
    when 0 then puts "That's the number!"
    when -1 then puts "Your guess is too low."
    end
    puts ""
  end

  def win?
    user.guess == target
  end

  def display_user_loses
    puts "You have no more guesses. You lost!"
    puts "The target number was: #{target}."
  end

  def display_welcome_message
    puts "Welcome to the guessing game!"
  end

  def display_user_wins
    puts "You won!"
  end

  def play
    reset
    loop do
      display_guesses_remaining
      user_guesses
      compare_guess_to_target
      self.num_guesses -= 1
      break display_user_wins if win?
      break display_user_loses if num_guesses == 0
    end
  end
end

game = GuessingGame.new
game.play
# puts "Next game is loading..."
# sleep(2.0)
# game.play