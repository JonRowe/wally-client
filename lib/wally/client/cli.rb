require 'optparse'

module Wally
  module Client
    class CLI

      def self.run args
        OptionParser.new do |parser|
          parser.banner = <<-Banner.gsub(/^\s+\|/,'')
            |Usage:
            |  wally push <url>/projects/<project-name> <features-dir>
            |  wally destroy <url>/projects/<project-name>
          Banner
        end.parse(args)

        command, url, *features = ARGV

        case command
          when "push"    then Command.new(url).push Parser.parse(features)
          when "destroy" then Command.new(url).destroy
        else
         abort "Please use --help for a listing of valid options"
        end
      rescue Wally::FeatureParseException
        puts "Couldn't parse features."
      end

    end
  end
end
