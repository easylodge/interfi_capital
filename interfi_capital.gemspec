# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'interfi_capital/version'

Gem::Specification.new do |spec|
  spec.name          = "interfi_capital"
  spec.version       = InterfiCapital::VERSION
  spec.authors       = ["Jean le Roux"]
  spec.email         = ["info@easylodge.com.au"]
  spec.summary       = %q{Interfi Capital Origination API integration}
  spec.description   = %q{Rails gem for using the Interfi Capital service.}
  spec.homepage      = "https://github.com/easylodge/interfi_capital"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency 'rails', '~> 4.2.0'
  spec.add_development_dependency 'shoulda-matchers', '~>2.8'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'faker'

  spec.add_dependency "faraday"
  spec.add_dependency 'activesupport'
end
