require_relative '../../test_helper'
 
describe CrawlBack::URL do
  before do
    @good_url = CrawlBack::URL.new("http://www.google.com")
    @bad_url  = CrawlBack::URL.new("google.com")
  end

  it "must parse URL" do
    @good_url.parsed_url.must_be_instance_of URI::HTTP
  end

  it "should return a module name" do
    @good_url.module_name.must_be_instance_of String
  end
end