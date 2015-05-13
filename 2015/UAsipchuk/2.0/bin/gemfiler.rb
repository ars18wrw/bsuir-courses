require 'optparse'
Dir['../lib/*.rb'].each { |f| require_relative(f) }

class SolutionBody
  def initialize
    @all = false;
  end

  def parse_cmd
    OptionParser.new do |opt|
      opt.banner = "Usage: gemfiler.rb [options]"
      opt.on('-h', '--help') do |v|
        p opt
        exit
      end
      opt.on('-m') do |v|
        @all = v;
      end
    end.parse!
  end
  
  def process
    parse_cmd
    p 'Error! Your request is incorrect.' if ARGV.size < 1
    
    vers = VersionFetcher.new(ARGV[0]).fetch
    cond = ARGV.slice(1, ARGV.size - 1)
    hash = VersionFilter.filter(vers, cond)
    
    Visualiser.show_good(hash) if @all
    Visualiser.show_all(hash) if !@all
  end

end

SolutionBody.new.process

