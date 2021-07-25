# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-hebcal/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-hebcal"
  spec.version       = Jekyll::Hebcal::VERSION
  spec.authors       = ["Barrie Callender"]
  spec.email         = ["barrie@callenb.org"]

  spec.summary       = %q{jekyll plugin to append Hebrew dat in parenthesis to Gregorian date string}
  spec.homepage      = "https://github.com/callenb/jekyll-hebcal."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/blob/master/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'jekyll'
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rest-client", "~> 2.1"
  spec.add_development_dependency "json", "~> 2.3"
end