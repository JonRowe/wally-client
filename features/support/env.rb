$:.unshift(File.join(File.dirname(__FILE__), "../../lib"))
ENV['RACK_ENV'] = 'test'

require 'aruba/cucumber'
require 'capybara/cucumber'

Capybara.app = Rack::Builder.new_from_string(<<-FILE)
require 'bundler/setup'
require 'wally'

run Sinatra::Application
FILE

module WallyHost
  def server
    @server ||= Capybara::Server.new(Capybara.app)
  end
  module_function :server

  def url
    "#{server.host}:#{server.port}"
  end
  module_function :url
end

Before do
  WallyHost.server.boot
  raise "not booted" unless WallyHost.server.responsive?
end

require 'mongo_mapper'
MongoMapper.connection = Mongo::Connection.new('localhost')
MongoMapper.database = "wally"

After do
  remove_file ".wally" rescue Errno::ENOENT
  MongoMapper.database.collections.each do |coll|
    coll.remove unless coll.name =~ /system/
  end
end
