require "restclient"

module Wally
  module Client
    class Command

      def initialize url
        @url = url
      end

      def push features
        RestClient.put url("/features/"), jsonify(features), json_headers
      end

      def destroy
        RestClient.delete url
      end

    private

      def code
        if File.exist?('.wally')
          '?authentication_code=' + File.read(".wally").strip
        else
          ''
        end
      end

      def url part = ""
        [@url, part, code].join
      end

      def jsonify features
        require "json"
        features.to_json
      end

      def json_headers
        { :content_type => :json, :accept => :json }
      end

    end
  end
end
