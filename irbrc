# vi: ft=ruby
puts "Loading .irbrc"

require 'irb/completion'
def models; ActiveRecord::Base.connection.tables; end
def connection; ActiveRecord::Base.connection.current_database; end

# interactive editor: use vim from within irb
begin
  require 'interactive_editor'
rescue LoadError => err
  warn "Couldn't load interactive_editor: #{err}"
end

# awesome print
begin
  require 'awesome_print'
  AwesomePrint.irb!
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

# pry: a more powerful shell to IRB
begin
  require 'pry'
rescue LoadError => err
  warn "Couldn't load pry: #{err}"
end
