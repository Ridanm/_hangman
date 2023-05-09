require './verifier_module.rb'

class Player 
  include Verifier
  attr_reader :letter 

  def enter_letter
    puts 'Enter a char from a to z'
    letter = gets.chomp 
  end
end

player = Player.new
puts letra = player.enter_letter
puts player.char_verifier(letra)
