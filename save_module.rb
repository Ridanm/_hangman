# This module implement save progress in case to leave game 
require './presentation_module.rb'

module Save 

  def enter_file_name_save
    puts Presentation::show_phrase('save_name')
  end

  def serialize(file_name_save, object_to_save)
    save = File.new(file_name_save.prepend('.yaml'), 'w')
    save.write(YAML::dump(object_to_save))
    save.close 
  end
end