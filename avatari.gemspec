# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'avatari', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'avatari'
    gem.version               = Avatari::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Add avatars to ActiveRecord models'
    gem.description           = 'Add avatars to ActiveRecord models.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://github.com/jonhue/avatari'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'vendor/**/*']
    gem.require_paths         = ['lib']

    gem.required_ruby_version = '>= 2.3'

    gem.add_dependency 'railties', '>= 5.0'
    gem.add_dependency 'activerecord', '>= 5.0'
    gem.add_dependency 'activesupport', '>= 5.0'
    gem.add_dependency 'mozaic', '~> 2.0'
    gem.add_dependency 'carrierwave', '~> 1.2'

    gem.add_development_dependency 'rake', '~> 12.3'
    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
