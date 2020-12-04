=begin
OOP TTT Bonus Features
Fri. 12/4/20
=end

class Board
  MIDDLE_SQ = 5
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[MIDDLE_SQ]}  |  #{@squares[6]}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def find_at_risk_squares(marker)
    offense, defense = sort_by_offense_defense(marker)
    return offense.sample unless offense.empty?
    return defense.sample unless defense.empty?
    return MIDDLE_SQ if @squares[MIDDLE_SQ].unmarked?
    unmarked_keys.sample
  end

  def full?
    unmarked_keys.empty?
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def sort_by_offense_defense(marker)
    offense = []
    defense = []
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      _, marked_squares = squares.partition(&:unmarked?)
      line_markers = marked_squares.map(&:marker)
      if marked_squares.size == 2 && line_markers.uniq.size == 1
        unmarked_index = line[squares.index(&:unmarked?)]
        (line_markers.all?(marker) ? offense : defense) << unmarked_index
      end
    end
    return offense, defense
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def valid_key?(key)
    (key.to_i.to_s == key) && unmarked_keys.include?(key.to_i)
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      next if squares.any?(&:unmarked?)
      markers = squares.map(&:marker)
      return markers.first if markers.uniq.size == 1
    end
    nil
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :score, :name

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

# Orchestration Engine
class TTTGame
  TEMP_HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  NUM_WINS = 2

  private

  attr_reader :board, :human, :computer
  attr_accessor :current_marker

  def initialize
    @board = Board.new
    @human = Player.new(TEMP_HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def clear
    system('clear')
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def computer_moves
    board[board.find_at_risk_squares(computer.marker)] = computer.marker
  end

  def current_player_moves
    if @current_marker == human.marker
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_board
    clear
    puts "Your marker: #{human.marker} \
         #{computer.name}'s marker: #{computer.marker}."
    puts "Your score: #{human.score} \
          #{computer.name}'s score: #{computer.score} \n\n"
    board.draw
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic-Tac-Toe. Goodbye!"
  end

  def display_overall_winner
    puts "------------------------------------"
    if human.score == NUM_WINS
      puts "YOU WON THE GAME!"
    else
      puts "#{computer.name} won the game :("
    end
  end

  def display_play_again_message
    puts "Let's play again, #{human.name}!"
    puts ""
  end

  def display_round_result
    update_score
    display_board
    case board.winning_marker
    when human.marker then puts "You won this round!"
    when TTTGame::COMPUTER_MARKER then puts "#{computer.name} won this round."
    else puts "It's a tie."
    end
  end

  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe!"
    puts ""
  end

  def human_moves
    puts "Choose a square at one of the available locations: " \
          "#{joinor(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.strip
      break if board.valid_key?(square)
      puts "Sorry, that's not a valid choice. Try again."
    end
    board[square.to_i] = human.marker
  end

  def human_turn?
    @current_marker == human.marker
  end

  def joinor(arr, separator = ', ', last_word = 'or')
    if arr.length > 2
      last_word += ' '
      arr[0..-2].join(separator) + separator + last_word + arr[-1].to_s
    else
      arr.join(" #{last_word} ")
    end
  end

  def main_game
    loop do
      pick_marker
      who_goes_first?
      display_board
      player_move
      display_round_result
      break if max_wins_reached?
      reset
      display_play_again_message
    end
  end

  def max_wins_reached?
    human.score == NUM_WINS || computer.score == NUM_WINS
  end

  def pick_marker
    answer = nil
    loop do
      puts "The computer is using #{COMPUTER_MARKER} as its game marker."
      print "Please pick a different single-character game marker: "
      answer = gets.chomp.strip
      break if answer.size == 1 && answer != COMPUTER_MARKER
      puts "Sorry, that's not a valid choice. Try again."
    end
    human.marker = answer
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n): "
      answer = gets.chomp.downcase
      break if %w(y n yes no).include?(answer)
    end
    %w(y yes).include?(answer)
  end

  def player_move
    loop do
      current_player_moves
      break if someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def reset
    puts "Board is being cleared for the next round..."
    sleep(3.0)
    board.reset
    clear
  end

  def set_computer_name
    computer.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def set_human_name
    answer = nil
    loop do
      print "What is your name?: "
      answer = gets.chomp.strip.capitalize
      break unless answer.empty?
      puts "Sorry, that's not a valid choice. Try again."
    end
    human.name = answer
  end

  def set_player_names
    set_human_name
    set_computer_name
  end

  def someone_won?
    !!board.winning_marker
  end

  def update_score
    case board.winning_marker
    when human.marker then human.score += 1
    when TTTGame::COMPUTER_MARKER then computer.score += 1
    end
  end

  def who_goes_first?
    answer = nil
    loop do
      print "Do you want to make the first move? " \
            "Select y/yes, n/no, or c/choose: "
      answer = gets.chomp.strip.downcase
      break if %w(y n yes no c choose).include?(answer)
      puts "Sorry, that's not a valid choice. Try again."
    end
    self.current_marker = if %w(y yes).include?(answer)
                            human.marker
                          elsif %w(n no).include?(answer)
                            COMPUTER_MARKER
                          else
                            [human.marker, COMPUTER_MARKER].sample
                          end
  end

  public

  def play
    clear
    display_welcome_message
    set_player_names
    main_game
    display_overall_winner
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
