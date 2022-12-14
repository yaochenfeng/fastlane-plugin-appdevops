lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/appdevops/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-appdevops'
  spec.version       = Fastlane::Appdevops::VERSION
  spec.author        = 'yaochenfeng'
  spec.email         = '282696845@qq.com'

  spec.summary       = 'app自动化'
  spec.homepage      = "https://github.com/yaochenfeng/fastlane-plugin-appdevops"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6'

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('fastlane', '>= 2.210.1')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rubocop', '1.12.1')
  spec.add_development_dependency('rubocop-performance')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
end
