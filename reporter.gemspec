# coding: utf-8

lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'reporter/version'

Gem::Specification.new do |spec|
  spec.name          = 'reporter-ruby'
  spec.version       = Reporter::VERSION
  spec.authors       = ['Ethan Turkeltaub']
  spec.email         = ['ethan.turkeltaub@gmail.com']
  spec.summary       = %q{A library to parse Reporter reports.}
  spec.description   = %q{A library to parse Reporter reports.}
  spec.homepage      = 'https://github.com/eturk/reporter-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'oj', '~> 2.6.1'
  spec.add_dependency 'hashie', '~> 2.0.5'
  spec.add_dependency 'activesupport', '~> 4.1.1'
end
