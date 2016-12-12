# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wally/client/version"

Gem::Specification.new do |s|
  s.name        = "wally-client"
  s.version     = Wally::Client::VERSION
  s.authors     = ["Jon Rowe"]
  s.email       = ["hello@jonrowe.co.uk"]
  s.homepage    = "https://github.com/JonRowe/wally-client"
  s.summary     = %q{Feature uploader for wally}
  s.description = %q{Feature uploader for wally}
  s.license     = 'GPL-3'

  s.files         = `git ls-files`.split("\n")
  s.files << "README.md"
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "gherkin"
  
  if RUBY_VERSION < '2'
    s.add_development_dependency 'public_suffix', '~> 1.4.6'
  end
  if RUBY_VERSION < '2.2.0'
    s.add_development_dependency 'activemodel', '< 5'
  end

  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber", '< 2.0.0'
  s.add_development_dependency "aruba"
  s.add_development_dependency "wally"
  s.add_development_dependency "capybara"
end
