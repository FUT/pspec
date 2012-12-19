# encoding: utf-8
require File.expand_path('../lib/pspec/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'pspec'
  s.version     = Pspec::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.author      = 'Yury Kaliada'
  s.email       = 'fut.wrk@gmail.com'
  s.description = 'Improvement of parallel_tests gem for PostgreSQL database. Provides enhanced database cloning.'
  s.homepage    = 'http://github.com/FUT/pspec'
  s.summary     = 'Provides you to clone your PostgreSQL databases extremely fast.'

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'

  s.add_dependency 'activerecord', '~> 3.1'
  s.add_dependency 'rack'
  s.add_dependency 'parallel_tests'

  s.add_development_dependency 'pry'

  s.rubyforge_project = s.name
end
