#!/usr/bin/env ruby
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
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] # default board
    @gameover = false
    @current_player = 0
    @number_of_moves = 1
  end

  def user_information
    i = 1
    until @player.getplayers.length == 2
      num = 'first'
      num = 'second' if i == 2
      print "Please Enter the name of the #{num} player:  "
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

  def display_welcome_message
    puts
    puts '********************************************************'
    puts '*                                                      *'
    puts '*            Welcome to Tic Tac Toe                    *'
    puts '*                                                      *'
    puts '********************************************************'
    puts '*                                                      *'
    puts '*            (1) Start                                 *'
    puts '*            (2) Exit                                  *'
    puts '*                                                      *'
    puts '********************************************************'
  end

  def correct_move(value)
    return false unless value.class == Integer
    return false unless (1..9).to_a.include?(value)

    true
  end

  def play
    until @gameover
      print "#{@player.getplayers[@current_player]['name']}Please Enter the number :  "
      move_value = gets.chomp
      if correct_move(move_value.to_i)
        display_board
        @current_player = @current_player.zero? ? 1 : 0
        @number_of_moves += 1
        @gameover = true if @number_of_moves > 9
      else
        puts 'Wrong input'
      end
    end
  end

  def start
    display_welcome_message
    try_again = true
    while try_again
      try_again = false
      print 'Please Enter the Number to continue:  '
      case gets.chomp
      when '1'
        # Get User Information
        user_information
        # Display board
        display_board
        # Start playing
        play
      when '2'
        exit
      else
        puts 'Wrong choice!'
        try_again = true
      end
    end
  end
end

Main.new.start
