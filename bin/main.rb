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

  def start
    # Get User Information
    user_information
    display_board
  end
end

Main.new.start
