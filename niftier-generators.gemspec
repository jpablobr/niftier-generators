Gem::Specification.new do |s|
  s.name        = "niftier-generators"
  s.version     = "0.4.6"
  s.author      = "Jose Pablo Barrantes (based on Ryan Bates niftier-generators)"
  s.email       = "xjpablobrx@gmail.com"
  s.homepage    = "http://github.com/jpablobr/niftier-generators"
  s.summary     = "A collection of useful Rails generator scripts."
  s.description = "A collection of useful Rails generator scripts for scaffolding, layout files, authentication, and more."

  s.files        = Dir["{lib,test,features,rails_generators}/**/*", "[A-Z]*"]
  s.require_path = "lib"

  s.add_development_dependency 'rspec-rails', '~> 2.0.1'
  s.add_development_dependency 'cucumber', '~> 0.9.2'
  s.add_development_dependency 'rails', '~> 3.0.0'
  s.add_development_dependency 'mocha', '~> 0.9.8'
  s.add_development_dependency 'bcrypt-ruby', '~> 2.1.2'
  s.add_development_dependency 'sqlite3-ruby', '~> 1.3.1'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
