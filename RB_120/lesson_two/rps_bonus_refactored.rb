=begin
RB120-129 Lesson 2
Assignment: OO Rock Paper Scissors Bonus Features
Sat. 11/28/20
=end

class Move
  include Comparable

  def <=>(other_move)
    return 0 if name == other_move.name
    beats?(other_move) ? 1 : -1
  end

  def beats?(other_move)
    beats.include?(other_move.name)
  end

  protected

  attr_reader :beats, :name
end

class Rock < Move
  def initialize
    @name = "Rock"
    @beats = ["Scissors", "Lizard"]
  end
end

class Paper < Move
  def initialize
    @name = "Paper"
    @beats = ["Rock", "Spock"]
  end
end

class Scissors < Move
  def initialize
    @name = "Scissors"
    @beats = ["Paper", "Lizard"]
  end
end

class Lizard < Move
  def initialize
    @name = "Lizard"
    @beats = ["Paper", "Spock"]
  end
end

class Spock < Move
  def initialize
    @name = "Spock"
    @beats = ["Scissors", "Rock"]
  end
end

class Player
  attr_accessor :moves, :name, :score

  def initialize
    @moves = []
    @score = 0
    set_name
  end

  def current_move
    moves.last
  end

  def display_moves
    moves.map(&:class).join(", ")
  end
end

class Human < Player
  def set_name
    input = ""
    loop do
      puts "What's your name?"
      input = gets.chomp.strip
      break unless input.empty?
      puts "Sorry, must enter a value."
    end
    self.name = input.capitalize
  end

  def choose
    choice = nil
    loop do
      puts "Choose one: rock/r, paper/p, scissors/c, lizard/l, spock/s: "
      choice = gets.chomp.downcase
      choice = translate_choice(choice)
      choice ? break : puts("Sorry, invalid choice. Try again.")
    end
    moves << choice
  end

  private
  def translate_choice(choice)
    case choice
    when "rock", "r" then Rock.new
    when "paper", "p" then Paper.new
    when "scissors", "c" then Scissors.new
    when "lizard", "l" then Lizard.new
    when "spock", "s" then Spock.new
    end
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    case name
    when 'R2D2' then options = [Rock]
    when 'Hal' then options = [Scissors, Scissors, Scissors, Scissors, Rock]
    when 'Chappie' then options = [Spock]
    when 'Sonny' then options = [Paper, Rock]
    when 'Number 5' then options = [Rock, Paper, Scissors, Lizard, Spock]
    end
    moves << options.sample.new
  end
end

# Game Orchestration Engine
class RPSGame
  WINS = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    system('clear')
    display_welcome_message
    display_rules
    play_round
    display_overall_winner
    pause
    display_all_moves
    display_goodbye_message
  end

  private

  def display_welcome_message
    welcome_message = <<~MSG
    Welcome to Rock, Paper, Scissors, #{human.name}!

    => You will be playing #{WINS} rounds against the computer.
    => The screen will be cleared after each round.
    => Please wait until the screen has been cleared to input your choice for the
       current round.
    => The rules will disappear after the first round is played.
    -------------------------------------------------------
    MSG
    puts welcome_message
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end

  def display_moves
    puts
    puts "#{human.name} chose #{human.current_move.class}"
    puts "#{computer.name} chose #{computer.current_move.class}"
  end

  def display_all_moves
    puts
    puts "#{human.name}'s moves: #{human.display_moves}"
    puts "#{computer.name}'s moves: #{computer.display_moves}"
    puts
  end

  def display_winner
    if human.current_move > computer.current_move
      puts "#{human.name} won this round!"
    elsif human.current_move < computer.current_move
      puts "#{computer.name} won this round."
    else
      puts "It's a tie."
    end
  end

  def display_overall_winner
    if human.score > computer.score
      puts "YOU WON THE GAME WITH #{human.score} POINTS!"
    else
      puts "#{computer.name} won the game with #{computer.score} points :("
    end
  end

  def pause
    3.times do |_|
      print "."
      sleep(0.75)
    end
    puts
  end

  def update_score
    if human.current_move > computer.current_move
      human.score += 1
    elsif human.current_move < computer.current_move
      computer.score += 1
    end
  end

  def display_rules
    rules = <<~MSG
    The rules are as follows:
    => Scissors cuts Paper
    => Paper covers Rock
    => Rock crushes Lizard
    => Lizard poisons Spock
    => Spock smashes Scissors
    => Scissors decapitates Lizard
    => Lizard eats Paper
    => Paper disproves Spock
    => Spock vaporizes Rock
    => Rock crushes Scissors
    MSG
    puts rules
    puts "-------------------------------------------------------"
  end

  def display_score
    puts
    puts "Your score: #{human.score} "
    puts "#{computer.name}'s score: #{computer.score}"
    puts "-------------------------------------------------------"
  end

  def someone_won?
    human.score == WINS || computer.score == WINS
  end

  def play_round
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      update_score
      display_score
      sleep(2.5)
      system('clear')
      break if someone_won?
    end
  end
end

RPSGame.new.play
