require 'colorize'

class Visualiser
  def self.show_all(vers_arr)
    vers_arr.each do |val, flag|
      puts flag ? val.green : val.red
    end
  end

  def self.show_good(vers_arr)
    vers_arr.each do |val, flag|
      puts val.green if flag
    end
  end
end
