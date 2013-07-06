# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cdn_assets/version'

Gem::Specification.new do |spec|
  spec.name          = "cdn_assets"
  spec.version       = CdnAssets::VERSION
  spec.authors       = ["Luke Horvat"]
  spec.email         = ["lukehorvat@gmail.com"]
  spec.description   = %q{Quickly and easily include popular CDN assets (e.g. jQuery, Twitter Bootstrap, Font Awesome, etc.) in your Ruby on Rails application.}
  spec.summary       = %q{Easily include popular CDN assets in your Rails app.}
  spec.homepage      = "https://github.com/lukehorvat/cdn_assets"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
