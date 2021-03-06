require 'optparse'
require 'zlib'

class Grep
  
  def initialize
    parse_cmd
    @pattern = ARGV.shift
  end

  def parse_cmd
    @opts = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: grep.rb [options]"

      opts.on('-h', '--h', '--help') do |s|
        puts opts
        exit
      end
      
      opts.on('-A') do |s|
        @opts[:A] = true;
      end

      opts.on('-e') do |s|
        @opts[:e] = true;
      end

      opts.on('-R') do |s|
        @opts[:R] = true;
      end

      opts.on('-z') do |s|
        @opts[:z] = true;
      end

    end.parse!
  end

  def parse_doc(doc)
    doc.each_with_index do |s, i|

      is_matched_str = (@opts[:e]) ? Regexp.new(@pattern).match(s) : s.include?(@pattern)
  
      if is_matched_str
        if (@opts[:A])
          if (i > 0)
	    puts doc[i-1]
	  end
	  puts s
	  if (i < doc.size - 1)
	    puts doc[i+1]
	  end
        else
	  puts s
        end
      end
    end
  end

  def main

    if (@opts[:R])
      files_to_parse = Dir.entries('.').select {|f| File.file? f}
      filse_to_parse.each do |i|
        parse_doc(File.open(i).to_a)
      end
    elsif (@opts[:z])
      Zlib::GZipReader.open(ARGV.shift) do |f|
	parse_doc(f.read.split("\n"))
      end
    else
      ARGV.each do |f|
        parse_doc(File.open(f).to_a)
      end
    end
  end

end

grep = Grep.new
grep.main
  
        


















