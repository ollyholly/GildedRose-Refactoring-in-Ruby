require 'rake'
# require_relative './lib/approval/texttest_fixture.rb'
require 'rspec/core/rake_task'
task :default => [:approval]

task :approval do
  ruby 'lib/approval/texttest_fixture.rb'
end

RSpec::Core::RakeTask.new(:spec) 

task :default  => :spec