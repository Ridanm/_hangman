# This module implement save progress in case to leave game 
require 'yaml'
require './presentation_module.rb'

module Save 
  include Presentation

  def self.enter_file_name_save
    print Presentation::save_phrase('save_name')
    file_name = gets.chomp.to_s 
    file_name.strip.gsub(/\s+/, '_')
  end

  def self.serialize(file_name_save, object_to_save)
    save = File.new(file_name_save.prepend('./save_progress/') + '.yaml', 'w')
    save.write(YAML::dump(object_to_save))
    save.close 
  end

  def self.unserialize(file_name)
    location = File.open(file_name)
    unserial = YAML::load(location)
  end

  def self.show_files
    @dir_files = Array.new
    @validate_numbers = Array.new 
    all_files = Dir['./save_progress/*'].select { |path| path if path.include?('.yaml')}
    if all_files.size == 0 
      puts Presentation::save_phrase("no_progress")
      exit 
    else 
      saved_files = Presentation::save_phrase("show_saved_files")
      puts Presentation::style(saved_files, 'green')
      all_files.each_with_index do |dir, index_file| 
        @dir_files << dir 
        index_file += 1
        @validate_numbers << index_file
        clear = dir.gsub(/\.\/save_progress\//,'')
        clear_all = clear.gsub(/\.yaml/, '')
        puts "#{index_file} #{clear_all}"
      end
    end
  end

  def self.recorver_file(all_files) 
    print Presentation::save_phrase('enter_corresponding_number')
    enter_number = gets.chomp.to_i 
    num = enter_number - 1
    return select_saved_file(all_files, num) if @validate_numbers.include?(enter_number)
    text = Presentation::save_phrase('warning')
    puts Presentation::style(text, 'light_red')
    Save::recorver_file(all_files)
  end

  def self.select_saved_file(all_files, num)
    return all_files[num] 
  end

  def self.run_serialize(object_name)
    yaml_name = enter_file_name_save
    serialize(yaml_name, object_name)
    puts "Saved progress"
  end

  def self.run_unserialize 
    show = show_files()
    recover = recorver_file(@dir_files)
    unserialize(recover)
  end

end
