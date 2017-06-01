require_relative 'lib/gitv'

Gem::Specification.new do |s|
  gitv = GitV.new

  s.name        = 'gitv'
  s.version     = gitv.version
  s.author      = 'Dmitry Fleytman'
  s.description = 'Yet another gem for versioning based on git tags'
  s.summary     = "gitv-#{s.version}"
  s.email       = 'rbld-devel@rbld.io'
  s.license     = 'Apache-2.0'
  s.homepage    = 'https://github.com/rbld/gitv'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.0.0'

  s.add_runtime_dependency 'colorize', '~> 0.8.1'

  s.add_development_dependency 'travis', '~> 1.8', '>= 1.8.2'
  s.add_development_dependency 'rubygems-tasks', '~> 0.2', '>= 0.2.4'
  s.add_development_dependency 'rake', '~> 11.2', '>= 11.2.2'
  s.add_development_dependency 'license_finder', '~> 3.0', '>= 3.0.0'

  s.require_path     = 'lib'
  s.bindir           = 'bin'

  lib_files          = `git ls-files -- #{s.require_path}`.split("\n")
  bin_files          = `git ls-files -- #{s.bindir}`.split("\n")

  s.files            = lib_files + bin_files + [ gitv.cache ]
  s.executables      = bin_files.map{ |f| File.basename(f) }
end
