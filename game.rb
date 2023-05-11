require './presentation_module'
require './secret_word.rb'
require './player.rb'

class Game 
  include Presentation

  attr_reader :word 

  def initialize(word, player)
    @word = word 
    @player = player 
    @@copy_underscore = []
    @loose_letter = []
    @turns = 0
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
    puts "\n#{guess}\n#{only_first}\n#{save}\n#{_exit}\n#{turn}#{shift_left}"
  end

  def underscores
    @underscore = ['_'] * word.size
  end

  def show_underscores
    underscore = underscores.join(' ')
    underscore_style = Presentation::style(underscore, 'light_yellow')
    puts "\nWord: #{underscore_style}\n\n"
  end

  def shift_left 
    @turns = word.size 
  end

  def type_letter
    @player.enter_letter
  end

  def remaining_turns 
    subtracting_turn = shift_left - 1 
    puts "Remaining turns: #{subtracting_turn}"
  end

  def match_letter!
    puts word 
    letter = type_letter 
    @copy_underscore = underscores 
    if word.include?(letter)
      word.chars.each_with_index do |ch, ind|
        if ch == letter 
          @copy_underscore[ind] = ch 
        end 
      end
    else 
      puts "Nop yet "
      if @loose_letter.include?(letter)
        puts @loose_letter
      else 
        @loose_letter << letter 
        puts @loose_letter
      end
    end
    copy_ = @copy_underscore.join(' ')
    puts Presentation::style(copy_, 'light_yellow')
  end

  def winner
    winner = Presentation::show_phrase('winner')
    puts winner 
  end

  def loose 
    loose = Presentation::show_phrase('loose')
    puts loose 
  end

  def thanks
    thanks = Presentation::show_phrase('thanks')
    thanks_style = Presentation::style(thanks, 'light_green')
    puts thanks_style
  end

  def play 
    title 
    game_info 
    underscores
    remaining_turns
    show_underscores
    match_letter!
  end
end

word = SecretWord.new.select_word 
player = Player.new
game = Game.new(word, player)

game.play 
