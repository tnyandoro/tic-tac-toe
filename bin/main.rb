# Player Class
class Player
  def initialize
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def getplayers
    @players
  end
end

# Main Class
class Main
  def initialize
    @player = Player.new
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def user_information
    i = 1
    until @player.getplayers.length == 2
      num = 'first'
      num = 'second' if i == 2
      puts "Please Enter the #{num} player"
      input = gets.chomp
      @player.add_player({ 'name' => input })
      i += 1
    end
  end

  def display_board
    puts
    puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    puts '---|---|---'
    puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    puts '---|---|---'
    puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
    puts
  end

  def start
    # Get User Information
    user_information
    display_board
  end
end

Main.new.start
