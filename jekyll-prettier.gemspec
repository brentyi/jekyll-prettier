# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-prettier'
  spec.version       = '0.0.0'
  spec.summary       = 'Jekyll formatting plugin'
  spec.description   = 'Jekyll (Ruby static website generator) plugin that runs prettier on generated outputs.'
  spec.authors       = %w(brentyi)
  spec.email         = 'brentyi@berkeley.edu'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.homepage      = 'https://github.com/brentyi/jekyll-prettier'
  spec.license       = 'MIT'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4'

  spec.add_dependency 'jekyll', '>= 3.8'
end
