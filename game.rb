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

  def word 
    @word 
  end

  def word_space 
    @word.size 
  end

  def underscores
    underscore = ['_'] * word_space 
  end

  def show_underscores
    puts underscores.join(' ')
  end

  def play 
    
  end
end

word = SecretWord.new.select_word 
player = Player.new
game = Game.new(word, player)
game.show_underscores

puts game.underscores.class 
