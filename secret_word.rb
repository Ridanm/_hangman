require 'colorize'

class SecretWord 
  attr_accessor 

  def initialize 
    @arr_words = []
  end

  def select_word
    words = File.open('./google-10000-english-no-swears.txt', 'r') do |word|
      all = word.readlines
      all.select do |big|
        if big.strip.size.between?(5, 12)
          @arr_words << big.strip
        end
      end
    end

    @arr_words.shuffle.sample
  end
end