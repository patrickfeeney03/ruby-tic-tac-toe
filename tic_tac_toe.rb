class Board
  def initialize
    @board_hash = create_hash
  end

  def valid_choice?(choice)
    ((1..9).include? board_hash[choice]) || (return false)
    ((1..9).include? choice) || (return false)
    true
  end

  def game_over?
    if check_win || draw?
      true
    else
      false
    end
  end

  def winner
    check_win
  end

  def print
    2.times do |i|
      puts "#{board_hash[1 + 3 * i]} | #{board_hash[2 + 3 * i]} | #{board_hash[3 + 3 * i]}"
      puts '- + - + -'
    end
    puts "#{board_hash[7]} | #{board_hash[8]} | #{board_hash[9]}"
  end

  def update(number, symbol)
    @board_hash[number] = symbol
  end

  private

  attr_reader :board_hash

  def check_win
    3.times do |i|
      if board_hash[1 + 3 * i] == board_hash[2 + 3 * i] && board_hash[2 + 3 * i] == board_hash[3 + 3 * i]
        return board_hash[1 + 3 * i]
      elsif board_hash[1 + 1 * i] == board_hash[4 + 1 * i] && board_hash[4 + 1 * i] == board_hash[7 + 1 * i]
        return board_hash[1 + 1 * i]
      end
    end
    if board_hash[1] == board_hash[5] && board_hash[5] == board_hash[9]
      return board_hash[1]
    elsif board_hash[7] == board_hash[5] && board_hash[5] == board_hash[3]
      return board_hash[7]
    end

    false
  end

  def draw?
    board_hash.each do |_k, v|
      ((1..9).include? v) && (return false)
    end
    true
  end

  def create_hash
    hash = {}
    (1..9).each do |elem|
      hash.update({ elem => elem })
    end
    hash
  end
end

class Player
  attr_reader :choice, :character

  def initialize(character)
    @character = character
  end

  def set_choice
    @choice = gets.chomp
  end

  def print_player
    puts "\nPlayer's #{character} turn >> "
  end
end

class Game
  attr_reader :x_player, :o_player, :board

  def initialize
    @board = Board.new
    @x_player = Player.new('X')
    @o_player = Player.new('O')
    @current_player = @x_player
  end

  def start
    puts 'Starting game...'
    current_player.print_player
    board.print
    while board.game_over? == false
      current_player.set_choice
      if board.valid_choice?(current_player.choice.to_i)
        board.update(current_player.choice.to_i, current_player.character)
        self.current_player =
          if current_player == x_player
            o_player
          else
            x_player
          end
      else
        puts 'Not valid. Try again...'
      end
      current_player.print_player
      board.print
    end

    print_result
  end

  private

  attr_accessor :current_player

  def print_result
    if board.winner
      puts "Player #{board.winner} won!"
    else
      puts 'Draw!!!'
    end
  end
end

game = Game.new
game.start
