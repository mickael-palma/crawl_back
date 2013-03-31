#!/usr/bin/env rake
require "bundler/gem_tasks"
 
require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.libs << 'lib/crawl_back'
  t.test_files = FileList['test/lib/**/test_*.rb']
  t.verbose = true
end
 
task :default => :test