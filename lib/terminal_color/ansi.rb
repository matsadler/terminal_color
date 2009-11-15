module Terminal # :nodoc:
  module Color # :nodoc:
    module ANSI
      BLACK = BLACK_FOREGROUND = 30
      RED = RED_FOREGROUND = 31
      GREEN = GREEN_FOREGROUND = 32
      YELLOW = YELLOW_FOREGROUND = 33
      BLUE = BLUE_FOREGROUND = 34
      MAGENTA = MAGENTA_FOREGROUND = 35
      CYAN = CYAN_FOREGROUND = 36
      WHITE = WHITE_FOREGROUND = 37
      
      BRIGHT_BLACK = BRIGHT_BLACK_FOREGROUND = 90
      BRIGHT_RED = BRIGHT_RED_FOREGROUND = 91
      BRIGHT_GREEN = BRIGHT_GREEN_FOREGROUND = 92
      BRIGHT_YELLOW = BRIGHT_YELLOW_FOREGROUND = 93
      BRIGHT_BLUE = BRIGHT_BLUE_FOREGROUND = 94
      BRIGHT_MAGENTA = BRIGHT_MAGENTA_FOREGROUND = 95
      BRIGHT_CYAN = BRIGHT_CYAN_FOREGROUND = 96
      BRIGHT_WHITE = BRIGHT_WHITE_FOREGROUND = 97
      
      BLACK_BACKGROUND = 40
      RED_BACKGROUND = 41
      GREEN_BACKGROUND = 42
      YELLOW_BACKGROUND = 43
      BLUE_BACKGROUND = 44
      MAGENTA_BACKGROUND = 45
      CYAN_BACKGROUND = 46
      WHITE_BACKGROUND = 47
      
      BRIGHT_BLACK_BACKGROUND = 100
      BRIGHT_RED_BACKGROUND = 101
      BRIGHT_GREEN_BACKGROUND = 102
      BRIGHT_YELLOW_BACKGROUND = 103
      BRIGHT_BLUE_BACKGROUND = 104
      BRIGHT_MAGENTA_BACKGROUND = 105
      BRIGHT_CYAN_BACKGROUND = 106
      BRIGHT_WHITE_BACKGROUND = 107
      
      RESET = 0
      RESET_FOREGROUND = 39
      RESET_BACKGROUND = 49
      
      BOLD = 1
      NEGATIVE = INVERSE = REVERSE = 7
      UNDERLINE = 4
      
      def self.escape(*args) # :nodoc:
        args = [0] if args.empty?
        "\e[#{args.join(";")}m"
      end
      
      # :call-seq: ANSI.color(string, color, ...) -> colored_string
      # 
      # Returns a colored version of +string+
      #  puts Terminal::Color::ANSI.color("Hello world!", :green)
      #  puts Terminal::Color::ANSI.color("Warning", :black, :yellow_background)
      # 
      def self.color(string, *args)
        reset = if args.last then true else args.pop end
        args.map! {|arg| parse_color(arg)}
        
        "#{escape(*args)}#{string}#{escape(RESET) if reset}"
      end
      class << self
        alias colour color
        alias style color
      end
      
      # :call-seq: obj.color(color, ...) -> colored_string
      # 
      # Returns a colored string representation of +obj+
      #  puts "Hello world!".color(:green)
      #  puts "Warning".color(:black, :yellow_background)
      # 
      def color(*args)
        Terminal::Color::ANSI.color(self.to_s, *args)
      end
      alias colour color
      alias style color
      
      private
      def self.parse_color(string)
        return string if string.is_a?(Integer)
        
        string = string.to_s.upcase
        string.sub!(/_BG$/, "_BACKGROUND")
        string.sub!(/_FG$/, "_FOREGROUND")
        const_get(string)
      end
    end
  end
  Colour = Color
end