module Jekyll
  class LessConverter < Converter # By davejlong
    safe true
    priority :high
    
    def setup
      return if @setup
      require 'less'
      @less_path = ['./src/css'] # Change this to change where LESS files are stored
      @setup = true
    rescue LoadError
      STDERR.puts 'You are missing the library required for less. Please run:'
      STDERR.puts ' $ [sudo] gem install less'
      raise FatalException.new("Missing dependency: less")
    end
    
    def matches(ext)
      ext =~ /less|lcss/i
    end
    
    def output_ext(ext)
      "" #removed .css, I prefer to name files .css.less
    end
    
    def convert(content)
      setup
      begin
        Less::Parser.new( :paths => @less_path ).parse(content).to_css
      rescue => e
        puts "Less Exception: #{e.message}"
      end
    end
  end
end