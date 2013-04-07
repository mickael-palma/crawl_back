require 'minitest/autorun'
require 'minitest/pride'
require 'debugger'

require_relative '../lib/crawl_back'

TEST_ROOT = "#{File.expand_path(File.dirname(__FILE__))}" unless defined?(TEST_ROOT)

# require every module test files
Dir[File.join(CRAWLBACK_ROOT , "/modules/*.rb")].each { |file| require file }