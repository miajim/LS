=begin
RB120 - 129 Lesson 2
Assignment: OO Rock Paper Scissors
Wed. 11/18/20
=end

class Move
  include Comparable
  VALS = ['rock', 'paper', 'scissors']
  COMBOS = [[VALS[0], VALS[1]], [VALS[1], VALS[2]], [VALS[2], VALS[0]]]

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  # @@start = Time.now
  def <=>(other_move)
    moves = [value, other_move.value]
    return 0 if moves.first == moves.last
    COMBOS.each do |pair|
      next unless moves.all? { |move| pair.include?(move) }
      return (moves == pair ? -1 : 1)
    end
  end

  # def >(other_move)
  #   (rock? && other_move.scissors?) ||
  #     (paper? && other_move.rock?) ||
  #     (scissors? && other_move.paper?)
  # end

  # def <(other_move)
  #   !(self > other_move) && (value != other_move.value)
  # end
  # @@finish = Time.now
  # @@total_time = @@finish - @@start

  # def self.display_total_time
  #   puts @@total_time
  # end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    @move = nil
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors: "
      choice = gets.chomp
      break if Move::VALS.include?(choice)
      puts "Sorry, invalid choice. Try again."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALS.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, #{human.name}!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, #{human.name}. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won :("
    else
      puts "It's a tie."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play_again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must by y or n."
    end
    answer == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
# Move.display_total_time

# Code "Archive"----------------------------------------------------------------

# class Rule
#   def initialize
#     # not sure what the "state" of a rule object should be
#   end
# end

# # not sure where "compare" goes yet
# def compare(move1, move2)

# end

#   case human.move
#   when 'rock'
#     puts "It's a tie!" if computer.move == 'rock'
#     puts "#{human.name} won!" if computer.move == 'scissors'
#     puts "#{computer.name} :(" if computer.move == 'paper'
#   when 'paper'
#     puts "It's a tie!" if computer.move == 'paper'
#     puts "#{human.name} won!" if computer.move == 'rock'
#     puts "#{computer.name} won :(" if computer.move == 'scissors'
#   when 'scissors'
#     puts "It's a tie!" if computer.move == 'scissors'
#     puts "#{human.name} won!" if computer.move == 'paper'
#     puts "#{computer.name} :(" if computer.move == 'rock'
#   end

# Logic Process
# scissors beats paper
# paper beats rock
# rock beats scissors

# rock < paper < scissors < rock < paper < scissors < ...

# scissors <=> paper : 1
# scissors <=> scissors: 0
# scissors <=> rock : -1

# paper <=> rock : 1
# paper <=> paper : 0
# paper <=> scissors : -1

# rock <=> scissors : 1
# rock <=> rock : 0
# rock <=> paper : -1

=begin
  s - p   p - r  r - r
  s - s   p - p
  s - r

  conditions that would return 0 : s-s, p-p, r-r

  now we're only looking at 3 conditions
  s - p (scissors wins, paper loses)
    > s - p (1) vs. p - s (-1)
  p - r (paper wins, rock loses)
    > p - r (1) vs.  r - p (-1)
  r - s (rock wins, scissors loses)
    > s - p (1) vs. p - s (-1)

  # def <=>(other_player_move)
    # return 0 if value == other_player_move.value
    # return 1 if (scissors? && other_player_move.paper? ||
    #             paper? && other_player_move.rock? ||
    #             rock? && other_player_move.scissors?)
    # return -1
  # end

  def >(other_move)
    (rock? && other_move.scissors?) ||
    (paper? && other_move.rock?) ||
    (scissors? && other_move.paper?)
  end

  def <(other_move)
    !(self > other_move)
  end

  # def <(other_move)
  #   if rock?
  #       return true if other_move.paper?
  #       return false
  #   elsif paper?
  #       return true if other_move.scissors?
  #       return false
  #   elsif scissors?
  #       return true if other_move.rock?
  #       return false
  #   end
  #   return false
  # end

#     def <=>(other_move)
#     moves = [value, other_move.value]
#     return 0 if moves.first == moves.last
#     COMBOS.each do |pair|
#       if moves == pair
#         return -1
#       elsif moves.reverse == pair
#         # moves.all? { |move| pair.include?(move) } # t = 2.561e-06
#         # moves.sort == pair.sort  # t = 2.751e-06
#         return 1
#       end
#     end
#   end
  def <=>(other_move)
    moves = [value, other_move.value]
    return 0 if moves.first == moves.last
    COMBOS.each do |pair|
      if moves == pair
        return -1
      elsif moves.reverse == pair
        return 1
      end
    end
  end
=end
