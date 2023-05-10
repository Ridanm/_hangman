require 'colorize'

module Presentation 
  def self.show_phrase(string)
    {
      'title' => 'Welcome to the Hangman game',
      'guess' => 'Guess the word each underscore represents a letter',
      'turns' => 'It depend on the word are the turns you have to guess',
      'save' => 'If you want to save the game before exiting type: save',
      'winner' => 'Congratulations you guessed the word',
      'loose' => "The word hasn't been guessing do you want try again type: yes",
      'exit' => 'If you have leave the game in any time write: exit',
      'thanks' => "\nThanks for playing...\nFor improvements in the game or bugs contact: danyfox1.dm@gmail.com"
    }[string]
  end

  def self.style(phrase, color)
    {
      color => phrase.colorize(color.to_sym)
    }[color]
  end
end
