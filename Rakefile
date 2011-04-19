require 'rake'
require 'rake/rdoctask'
require 'rcov/rcovtask'
require 'rspec/core/rake_task'

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "./spec/**/*_spec.rb"
end

desc "Generate code coverage"
RSpec::Core::RakeTask.new(:rcov) do |t|
  t.pattern = "./spec/**/*_spec.rb"
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec']
end

Rake::RDocTask.new(:doc) do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Roundup #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :default => :spec

