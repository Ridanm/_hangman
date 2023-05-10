require './presentation_module'
require './verifier_module'
require './secret_word.rb'
require './player.rb'

class Game 
  include Presentation
  include Verifier 

  attr_reader :word 

  def initialize(word, player)
    @word = word 
    @player = player 
    @turns = 8
  end

  def word_space 
    @word.size 
  end

  def underscores
    underscore = ['_'] * word_space 
  end

  def show_underscores
    underscore = underscores.join(' ')
    underscore_style = Presentation::style(underscore, 'light_blue')
    puts underscore_style
  end

  def title
    title = Presentation::show_phrase('title')
    long = title.size 
    title_style = Presentation::style(title, 'light_green')
    puts "\n#{title_style.center(long*2)}"
  end

  def game_info
    guess = Presentation::show_phrase('guess')
    save = Presentation::show_phrase('save')
    save_style = Presentation::style(save, 'light_yellow')
    puts "\n#{guess}\n#{save}"
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

  def exit_ 
    _exit = Presentation::show_phrase('exit')
    puts _exit 
  end

  def play 
    
  end
end

word = SecretWord.new.select_word 
player = Player.new
game = Game.new(word, player)

game.title 
game.game_info 
game.exit_
game.show_underscores
game.thanks
