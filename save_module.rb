# This module implement save progress in case to leave game 
require 'yaml'
require './presentation_module.rb'

class Prueba 
  def initialize(name)
    @name = name 
  end
end
prueba = Prueba.new("Richard")

module Save 

  def self.enter_file_name_save
    print Presentation::save_phrase('save_name')
    file_name = gets.chomp.to_s 
    file_name.strip.gsub(/\s/, '_')
  end

  def self.serialize(file_name_save, object_to_save)
    save = File.new(file_name_save.prepend('./save_progress/') + '.yaml', 'w')
    save.write(YAML::dump(object_to_save))
    save.close 
  end

  def unserialize(file_name)
    file_name = file_name.prepend('./')
    location = File.open(file_name)
    unserial = YAML::load(location)
  end

  def show_files 
    all_files = Dir['./*'].select { |path| path if path.include?('.yaml')}
    if all_files.size == 0 
      puts Presentation::save_phrase('no_progress')
    else 
      puts all_files 
    end
  end

  def recorver_file(all_files) 
    print Presentation::show_phrase('enter_corresponding_number')
    num = gets.chomp.to_i 
    num -= 1
    select_saved_file(all_files, num)
  end

  def select_saved_file(all_files, num)
    puts all_files[num] 
  end

  def self.run_serialize(object_name)
    yaml_name = enter_file_name_save
    serialize(yaml_name, object_name)
    puts "Saved progress"
  end

  def self.run_unserialize 
    show = show_files()
    recover = recorver_file(show)
    unserialize(recover)
  end

end

puts "Guardando objeto en archivo yaml"
guardar = Save.run_serialize(prueba)
 