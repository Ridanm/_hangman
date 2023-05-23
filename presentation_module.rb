require 'colorize'

module Presentation 
  def self.show_phrase(string)
    {
      'title' => 'Welcome to the Hangman game',
      'try_again' => 'Try again new game',
      'beginning' => "\nFor a new game type  1 \nTo load a saved game 2",
      'guess' => 'Guess the word each underscore represents a letter.',
      'only_first' => 'If you enter more than one letter, only the first will be valid.',
      'turns' => 'It depend on the word are the turns you have to guess, in this case: ',
      'save' => "Save the game type: save \nCan you exit or continue playing after saving.",
      'enter_char' => 'Enter a char from a to z: ',
      'warning' => 'Enter only characters from a to z',
      'winner' => "Congratulations you guessed the word...\nif you want try again write: yes ",
      'loose' => "The word hasn't been guessing... \nif you want play again write: yes or any key to leave the game.",
      'exit' => 'If you have leave the game in any time write: exit',
      'thanks' => "\nThanks for playing...\nFor improvements in the game or bugs contact: danyfox1.dm@gmail.com"
    }[string]
  end

  def self.save_phrase(string)
    {
      'show_saved_files' => "\nThese are the saved files of pregress in previous games.",
      'save_name' => "Enter the name you want to save this game with: ",
      'enter_corresponding_number' => "\nEnter only the number of corresponding file you want to continue: ",
      'warning' => "\nThat number is not in the save files.",
      'no_progress' => "\nThere is no save game to display."
    }[string]
  end

  def self.style(phrase, color)
    {
      color => phrase.colorize(color.to_sym)
    }[color]
  end
end
