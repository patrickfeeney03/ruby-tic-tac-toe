class Board
  def initialize
    @board_hash = create_hash
  end

  def reset

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

  def draw
    puts "\n\n"
    2.times do |i|
      puts "#{board_hash[1 + 3 * i]} | #{board_hash[2 + 3 * i]} | #{board_hash[3 + 3 * i]}"
      puts '- + - + -'
    end
    puts "#{board_hash[7]} | #{board_hash[8]} | #{board_hash[9]}"
  end

  def update(number, symbol)
    @board_hash[number] = symbol
    draw
  end

  def test_update_hash
    board_hash[7] = 'X'
    board_hash[8] = 'X'
    board_hash[9] = 'X'
  end

  def test_update_hash2
    board_hash[1] = 'X'
    board_hash[2] = 'O'
    board_hash[3] = 'X'
    board_hash[4] = 'X'
    board_hash[5] = 'O'
    board_hash[6] = 'X'
    board_hash[7] = 'O'
    board_hash[8] = 'X'
    board_hash[9] = 'O'
  end

  private

  def check_win
    3.times do |i|
      if board_hash[1 + 3 * i] == board_hash[2 + 3 * i] && board_hash[2 + 3 * i] == board_hash[3 + 3 * i]
        return board_hash[1 + 3 * i]
      elsif board_hash[1 + 1 * i] == board_hash[4 + 1 * i] && board_hash[4 + 1 * i] == board_hash[7 + 1 * i]
        return board_hash[1 * i]
      end
    end
    if board_hash[1] == board_hash[5] && board_hash[5] == board_hash[9]
      return board_hash[1]
    elsif board_hash[4] == board_hash[5] && board_hash[5] == board_hash[3]
      return board_hash[4]
    end
  end

  def draw?
    board_hash.each do |_k, v|
      ((1..9).include? v) && (return false)
    end
    true
  end

  def board_hash
    @board_hash
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
  #attr_accessor :choice

  def initialize(character)
    @character = character
  end


  def get_input
    @choice = gets.chomp
  end

  def input
    @choice
  end

  def character
    @character
  end

  private
  def choice=(number)
    @choice = number
  end

  def choice
    @choice
  end
end

class Game
  def initialize
    @board = Board.new
    @x_player = Player.new('X')
    @o_player = Player.new('O')
    @current_player = @x_player
  end

  def start
    puts 'Starting game...'
    board.draw
    while board.game_over? == false
      current_player.get_input
      #puts "Player:#{current_player.character} chose #{current_player.input}"
      p current_player.input
      p current_player.character
      board.update(current_player.input.to_i, current_player.character)
      self.current_player =
        if current_player == x_player
          #puts 'Setting player to O'
          o_player
        else
          #puts 'Setting player to X'
          x_player
        end
    end
  end

  def x_player
    @x_player
  end

  def o_player
    @o_player
  end

  def board
    @board
  end

  private
  def current_player
    @current_player
  end

  def current_player=(player)
    @current_player = player
  end
end

game = Game.new
game.start
# game.x_player.get_input
# p game.x_player.input
#game.board.draw
#game.board.test_update_hash2

