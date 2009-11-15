Gem::Specification.new do |s|
  s.name = "terminal_color"
  s.version = "0.0.1"
  s.summary = "Terminal colors."
  s.description = "A tiny Ruby library for colorizing terminal output."
  s.files = ["lib/terminal_color/ansi.rb"]
  s.require_path = "lib"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.txt"]
  s.rdoc_options << "--main" << "README.txt"
  s.author = "Matthew Sadler"
  s.email = "mat@sourcetagsandcodes.com"
  s.homepage = "http://github.com/matsadler/terminal_color"
end