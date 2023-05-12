require './presentation_module'
require './secret_word.rb'
require './player.rb'

class Game 

  include Presentation

  attr_reader :word 

  def initialize(word, player)
    @word = word 
    @player = player 
    @copy_underscore = ['_'] * word.size 
    @wrong_letter = []
    @turns = word.size 
  end

  def title
    title = Presentation::show_phrase('title')
    long = title.size 
    title_style = Presentation::style(title, 'light_green')
    puts "\n#{title_style.center(long*2)}"
  end

  def game_info
    guess = Presentation::show_phrase('guess')
    only_first = Presentation::show_phrase('only_first')
    save = Presentation::show_phrase('save')
    _exit = Presentation::show_phrase('exit')
    turn = Presentation::show_phrase('turns')
    puts "\n#{guess}\n#{only_first}\n#{save}\n#{_exit}\n#{turn}#{@turns}"
  end

  def underscores
    @copy_underscore
  end

  def show_underscores
    underscore = underscores.join(' ')
    underscore_style = Presentation::style(underscore, 'light_yellow')
    puts "\nWord: #{underscore_style}\n\n"
  end

  def type_letter
    @player.enter_letter
  end

  def remaining_turns 
    turn_left = "Remaining turns: "
    if @turns > 2
      print "#{Presentation::style(turn_left, 'light_yellow')}"
      puts  "#{Presentation::style(@turns.to_s, 'light_green')}"
    else 
      print "#{Presentation::style(turn_left, 'light_red')}"
      puts  "#{Presentation::style(@turns.to_s, 'light_yellow')}"
    end
  end

  def wrong_letter_selected
    wrong = "Wrong letter selected: "
    selected_letters = "#{@wrong_letter.map(&:upcase).join(', ')}"
    print Presentation::style(wrong, 'light_green')
    puts Presentation::style(selected_letters, 'light_yellow')
  end

  def match_letter!
    puts word 
    while @turns > 0 && underscores.include?('_')
      remaining_turns
      letter = type_letter 
      if word.include?(letter)
        word.chars.each_with_index do |ch, ind|
          if ch == letter 
            @copy_underscore[ind] = ch 
          end 
        end
      else 
        if @wrong_letter.include?(letter)
          wrong_letter_selected
        else 
          @wrong_letter << letter 
        end
        @turns -= 1
      end
      copy_ = @copy_underscore.join(' ')
      puts "\nWord: #{Presentation::style(copy_, 'light_yellow')}"
      wrong_letter_selected
      if winner? 
        winner = Presentation::show_phrase('winner')
        puts "\n#{Presentation::style(winner, 'light_blue')}" 
        the_word_was
      end
      loose if @turns == 0
    end
  end

  def winner?
    @copy_underscore.join('') == word 
  end

  def loose 
    loose = Presentation::show_phrase('loose')
    puts "\n#{Presentation::style(loose, 'light_red')}" 
    the_word_was
  end

  def the_word_was 
    puts "The word was: #{Presentation::style(word, 'light_yellow')}"
  end

  def thanks
    thanks = Presentation::show_phrase('thanks')
    thanks_style = Presentation::style(thanks, 'light_green')
    puts thanks_style
    exit 
  end

  def play 
    title 
    game_info 
    underscores
    show_underscores
    match_letter!
    play_again
  end

  def play_again 
    result = false 
    until result 
      type = gets.chomp
      if type == 'yes'
        Game.new(SecretWord.new.select_word , Player.new).play 
        result = false 
      else 
        thanks
        result = true 
      end
    end
  end

end

word = SecretWord.new.select_word 
player = Player.new
game = Game.new(word, player)

game.play 
puts game.winner? 

