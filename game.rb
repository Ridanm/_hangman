require './secret_word.rb'
require './presentation_module'
require './save_module.rb'
require './player.rb'

class Game 

  include Presentation
  include Save 

  attr_accessor :word, :player, :copy_underscore, :wrong_letter, :turns

  def initialize(word, player)
    @word = word 
    @player = player 
    @copy_underscore = ['_'] * word.size 
    @wrong_letter = Array.new 
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
      if letter == 'save'
        puts Presentation::style("SAVING THE GAME", 'light_green')
        Save::run_serialize(self)
        player.leave_game('exit')
      elsif word.include?(letter)
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
      wrong_letter_selected if !wrong_letter.nil? && !wrong_letter.empty?
      if winner? 
        won_msj
      end
      loose if @turns == 0
    end
  end

  def winner?
    @copy_underscore.join('') == word 
  end

  def won_msj 
    the_word_was
    winner = Presentation::show_phrase('winner')
    puts "\n#{Presentation::style(winner, 'light_green')}" 
  end

  def loose 
    the_word_was
    loose = Presentation::show_phrase('loose')
    puts "\n#{Presentation::style(loose, 'light_red')}" 
  end

  def the_word_was 
    puts "\nThe word was: #{Presentation::style(word.capitalize, 'light_yellow')}"
  end

  def thanks
    thanks = Presentation::show_phrase('thanks')
    puts Presentation::style(thanks, 'light_blue')
    exit 
  end

  def play 
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

  def beginning
    before = Presentation::show_phrase('beginning')
    puts Presentation::style(before, 'light_green')
    print 'Enter number: '
    start_num = gets.chomp 
    beginning if !start_num.match(/[1-2]/)
    if start_num == '1' 
      play 
    elsif start_num == '2'
      puts "Progress implement this"
      @reload = Save::run_unserialize

# IMPLEMENT THIS 
      p @reload 
      p @reload.word
      p @reload.copy_underscore
      p @reload.wrong_letter
      p @reload.turns 


    end
  end
end

word = SecretWord.new.select_word 
player = Player.new
game = Game.new(word, player)

game.title 
game.beginning 


