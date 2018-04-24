class Game

  attr_reader :players, :current_number, :current_player, :lives, :dead
  attr_writer :lives, :dead

  def initialize
    @players = ["Player 1", "Player 2"]
    @lives = [3, 3]
    @dead = false
    turn
  end

  def turn

  i = 0
    while @dead == false

      lives.each do |life|
        if life == 0
          puts "Game Over"
          @dead = true
          abort
        end
      end

      @current_number = i % 2
      @current_player = @players[@current_number]
      question
      i += 1
      if(@players[@current_number] == "Player 2")
        puts "Score is P1 #{lives[0]}/3 & P2 #{lives[1]}/3"
      end
    end
  end

  def question
    a = (rand * 20).round
    b = (rand * 20).round
    puts "#{current_player} what is #{a} + #{b}?"
    answer = gets.chomp.to_i
    provided = a + b
    if answer == provided
      puts "Yes"
    else
      puts "No"
      @lives[@current_number] = @lives[@current_number] - 1
    end
  end

end

g = Game.new;
