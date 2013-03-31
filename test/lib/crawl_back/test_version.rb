require_relative '../../test_helper'
 
describe CrawlBack do
 
  it "must be defined" do
    CrawlBack::VERSION.wont_be_nil
  end
  
  it "must be a string" do
    CrawlBack::VERSION.must_be_kind_of String
  end

end