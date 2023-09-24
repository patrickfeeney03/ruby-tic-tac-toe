class Board
  def initialize
    @board_hash = {}
    (1..9).each do |elem|
      @board_hash.update({ elem => elem })
    end
  end

  def create
    

  end

  def reset

  end

  def draw
    2.times do |i|
      puts "#{board_hash[1 + 3 * i]}|#{board_hash[2 + 3 * i]}|#{board_hash[3 + 3 * i]}"
      puts '-+-+-'
    end
    puts "#{board_hash[7]}|#{board_hash[8]}|#{board_hash[9]}"
  end

  private
  def board_hash
    @board_hash
  end
end

class Player
  #attr_accessor :choice

  def initialize(character)
    @character = character
  end


  def get_input
    self.choice = gets.chomp
  end

  def input
    self.choice
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
end

game = Game.new
game.x_player.get_input
p game.x_player.input
game.board.draw
