# require './save_module.rb'

class Player 
  attr_reader :letter 

  def type_char 
    enter_char = Presentation::show_phrase('enter_char')
    print enter_char 
  end

  def enter_letter
    type_char() 
    letter = gets.chomp.downcase 
    if letter == 'exit'
      leave_game(letter)
    elsif letter == 'save' 
      return 'save'
    elsif letter.between?('a', 'z')
        letter[0]
    else 
      warning_message()
      enter_letter()
    end 
  end

  def leave_game(close='')
    bye = Presentation::show_phrase('thanks')
    puts Presentation::style(bye, 'light_blue')
    exit if close == 'exit'
  end

  def warning_message  
    warning = Presentation::show_phrase('warning')
    warning_style = Presentation::style(warning, 'light_red')
    puts "#{warning_style}\n\n"
  end

end


