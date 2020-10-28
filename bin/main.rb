#!/usr/bin/env ruby
require_relative '../lib/game_logic'

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

class Interface
  def display_welcome_message
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

  def display_restart_or_exit_message
    puts '*********************************************************'
    puts '*     Would you like to play another round?             *'
    puts '*                (yes) Continue                         *'
    puts '*                (No)  Exit                             *'
    puts '*********************************************************'
  end

  def display_win_message(emoji_icon, player_name)
    i = emoji_icon
    n = player_name
    puts '********************************************************'
    puts '*                                                      *'
    puts "*             #{i} CONGRATULATIONS #{i}                *"
    puts "*                 #{n} YOU WON!                        *"
    puts '*                                                      *'
    puts '********************************************************'
  end

  def display_both_tried_message
    puts '*********************************************************'
    puts '*                 YOU BOTH TRIED                        *'
    puts '*********************************************************'
  end
end

# Main Class
class Main < Interface
  def initialize
    @player = Player.new
    @gameover = false
    @current_player = 0
    @number_of_moves = 1
    @default_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] # default board
    @game = Game.new(@default_board)
  end

  def user_information
    i = 1
    until @player.getplayers.length == 2
      num = 'first'
      mark = 'X'
      num = 'second' if i == 2
      mark = 'O' if i == 2
      print "Please Enter the name of the #{num} player:  "
      input = gets.chomp
      @player.add_player({ 'name' => input, 'mark' => mark })
      i += 1
    end
  end

  def display_board
    puts
    puts " #{@game.board[0][0]} | #{@game.board[0][1]} | #{@game.board[0][2]}"
    puts '---|---|---'
    puts " #{@game.board[1][0]} | #{@game.board[1][1]} | #{@game.board[1][2]}"
    puts '---|---|---'
    puts " #{@game.board[2][0]} | #{@game.board[2][1]} | #{@game.board[2][2]}"
    puts
  end

  def display_wrong_inputs_message(category, range)
    case category
    when 'range'
      puts "\nWrong input! Input should be any Integer number from
        #{range.to_a[0]} to #{range.to_a[range.to_a.length - 1]}\n"
    when 'yes_no'
      puts "\nWrong input! Input should be yes or no\n"
    when 'wrong_position'
      puts "\nWrong input! Please Select the Available positions\n"
    else
      puts 'Wrong Input!'
    end
  end

  def restart
    @game.reset_board
    @number_of_moves = 1
    @gameover = false
    @current_player = 0
    display_board
    play
  end

  def restart_or_exit
    display_restart_or_exit_message
    try_again = true
    while try_again
      try_again = false
      print 'Please Enter the Choice: '
      value = gets.chomp
      case value
      when 'yes'
        restart
      when 'no'
        exit
      else
        display_wrong_inputs_message('yes_no', nil)
        try_again = true
      end
    end
  end

  def display_gameover(won, player)
    if won
      display_win_message("\u{1F38A}", player['name'])
    else
      display_both_tried_message
    end
    restart_or_exit
  end

  def correct_move(value)
    return false, 'range' unless value.class == Integer
    return false, 'range' unless (1..9).to_a.include?(value)

    y_pos = @game.getpositions[value.to_s]['y']
    x_pos = @game.getpositions[value.to_s]['x']

    return false, 'wrong_position' if @game.board[x_pos][y_pos] == 'X'
    return false, 'wrong_position' if @game.board[x_pos][y_pos] == 'O'

    [true, nil]
  end

  def next_player
    @current_player.zero? ? 1 : 0
  end

  def check_gameover
    true if @number_of_moves > 9
  end

  def make_a_move(current_player, move_value, correct_move_res)
    if correct_move_res[0]
      @game.apply_move(move_value, current_player)
      display_board
      if @game.win(current_player)
        display_gameover(true, current_player)
        @gameover = true
      else
        @current_player = next_player
        @number_of_moves += 1
        @gameover = check_gameover
      end
    else
      display_wrong_inputs_message(correct_move_res[1], (1..9))
    end
  end

  def play
    until @gameover
      current_player = @player.getplayers[@current_player]
      print "#{current_player['name']}, Please Enter the number :  "
      move_value = gets.chomp
      correct_move_res = correct_move(move_value.to_i)
      make_a_move(current_player, move_value, correct_move_res)
    end
    display_gameover(false, nil)
  end

  def start
    display_welcome_message
    try_again = true
    while try_again
      try_again = false
      print 'Please Enter the Number to continue:  '
      case gets.chomp
      when '1'
        user_information
        display_board
        play
      when '2'
        exit
      else
        display_wrong_inputs_message('range', (1..2))
        try_again = true
      end
    end
  end
end

Main.new.start
