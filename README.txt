= Terminal Color
Terminal Color is a tiny Ruby library for colorizing, or colourising, string output to the terminal.

== Examples
  require 'terminal_color/ansi'
  
  puts Terminal::Color::ANSI.color("Hello world!", :green)

This isn't limited to strings

  puts Terminal::Color::ANSI.color(Time.now, :yellow)

Typing that chain of modules is going to get boring pretty quick

  class String; include Terminal::Color::ANSI; end
  puts "Warning".color(:black, :yellow_background)

That's not limited to strings either

  class Time; include Terminal::Color::ANSI; end
  puts Time.now.color(:bold, :white, :black_background)

We're not fussy about how you want to spell colour

  puts Terminal::Colour::ANSI.colour("Tally Ho!", :red, :white_background)
  puts "pip pip".colour(:blue)

You can make colours run on

  puts "this is red".color(:red, false)
  puts "so is this!"
  puts "lets put a stop to it now".style(:reset)

style is just an alias to color, it's there because "foo".color(:bold) looks strange

There are a few colours to choose from
  black
  red
  green
  yellow
  blue
  magenta
  cyan
  white
  
You can get them as a background by appending _background or _bg, and on some platforms a brighter version by prepending bright_. These work together so you can have bright_yellow_background for example.

  puts "Warning".color(:black, :bright_yellow_background)

There are some other not-strictly-colour options
  reset
  reset_forground (or reset_fg)
  reset_background (or reset_bg)
  negative (or inverse, or reverse)
  bold
  underline

You can use raw ANSI codes too
  puts Terminal::Color::ANSI.color("Italic, maybe", 3)

== Licence

The MIT License

Copyright (c) 2009 Matthew Sadler

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.