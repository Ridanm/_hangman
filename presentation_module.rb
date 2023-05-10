require 'colorize'

module Presentation 
  def self.show_phrase(string)
    {
      'title' => 'Welcome to the Hangman game',
      'exit' => 'If you have leave the game in any time write: exit',
      'guess' => 'Guess the word each underscore represents a letter',
      'turns' => 'Do you have 8 turns to guess the word',
      'save' => 'If you want to save the game before exiting type: save',
      'winner' => 'Congratulations you guessed the word',
      'loose' => "The word hasn't been guessing do you want try again type: yes",
      'thanks' => 'Thanks for playing...'
    }[string]
  end

  def self.style(phrase, color)
    {
      color => phrase.colorize(color.to_sym)
    }[color]
  end
end
