# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crawl_back/version'

Gem::Specification.new do |spec|
  spec.name          = "crawl_back"
  spec.version       = CrawlBack::VERSION
  spec.authors       = ["Mickael Palma"]
  spec.email         = ["mickael@spypp.com"]
  spec.description   = %q{API to query website}
  spec.summary       = %q{CrawlBack allows you to query a website and retrieve organized datas}
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
