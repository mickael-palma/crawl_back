require "crawl_back/version"
require "crawl_back/website"
require "crawl_back/url"
require "crawl_back/search"
require "crawl_back/module_name_extractor"
require "crawl_back/crawler"
require "crawl_back/website_options"

CRAWLBACK_ROOT = "#{File.expand_path(File.dirname(__FILE__))}/" unless defined?(CRAWLBACK_ROOT)

# require every module files
Dir[File.join(CRAWLBACK_ROOT, "modules/*.rb")].each { |file| require file }