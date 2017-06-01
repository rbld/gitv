require 'rubygems'
require 'rubygems/tasks'

Gem::Tasks.new

task :lint do
    begin
      require 'travis/yaml'

      puts 'Linting .travis.yml ... No output is good!'
      Travis::Yaml.parse! File.read('.travis.yml')
    rescue LoadError => e
      $stderr.puts "Failed to lint .travis.yml: #{e.message}"
    end
end

task :license do
  puts 'Running license_finder...'
  system('license_finder')
  exit 1 unless $? == 0
end

task :default => [:license, :build]
