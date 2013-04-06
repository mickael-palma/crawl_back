require_relative '../../test_helper'
 
describe CrawlBack::SEARCH do
  before do
    @search = CrawlBack::SEARCH.new("http://www.google.com", term: "test")
  end

  describe "Basic" do
    it "must be a CRAWLER results" do
      @search.results.must_be_instance_of CrawlBack::CRAWLER
    end
  end
end