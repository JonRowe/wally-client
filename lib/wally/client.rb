require 'wally/client/version'

module Wally
  module Client
    autoload 'CLI',     'wally/client/cli'
    autoload 'Command', 'wally/client/command'
    autoload 'Parser',  'wally/client/parser'
  end
end
