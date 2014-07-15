require "wally/parses_features"

module Wally
  module Client
    class Parser

      def self.parse paths
        new(paths).load
      end

      def initialize paths
        @paths = paths
      end

      def load
        @paths.inject([]) do |features, path|
          Dir.glob(File.join(path, "**/*.feature")) do |feature_path|
            gherkin = Wally::ParsesFeatures.new.parse(File.read feature_path)
            features << {:path => feature_path, :gherkin => gherkin}
          end
          features
        end
      end

    end
  end
end
