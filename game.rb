require 'colorize'

arr_words = []

words = File.open('./google-10000-english-no-swears.txt', 'r') do |word|
  all = word.readlines
  all.select do |big|
    if big.size.between?(6, 13)
      arr_words << big
    end
  end
end

puts arr_words.shuffle.sample
