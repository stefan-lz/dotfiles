# vi: ft=ruby
puts "Loading .pryrc"

# awesome print
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end

# hirb: for some nice tables
begin
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  warn "Couldn't load hirb: #{err}"
end

if defined?(PryDebugger)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
