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
