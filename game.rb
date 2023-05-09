require './secret_word.rb'
require './player.rb'

class Game 
  attr_reader :word 

  def initialize(word, player)
    @word = word 
    @player = player 
    save_word = []
  end

  def show_spaces_word 
    p save_word = word
    replace = save_word.gsub(/[a-z]/, '_')
    replace.each_char { |c| print "#{c} "}
  end
end

word = SecretWord.new.select_word 
player = Player.new
game = Game.new(word, player)
game.show_spaces_word