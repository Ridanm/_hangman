require './secret_word.rb'
require './presentation_module'
require './save_module.rb'
require './player.rb'
require './game.rb'

word = SecretWord.new.select_word 
player = Player.new
game = Game.new(word, player)
game.beginning 