module Verifier 
  def char_verifier(str)
    str.downcase!
    if str.between?('a', 'z')
      if str.length == 1
        return str
      elsif str.length > 1
        return str[0]
      end
    else 
      puts 'Enter only characters from a to z'
    end
  end
end