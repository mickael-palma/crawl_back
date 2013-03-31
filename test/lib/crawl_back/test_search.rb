require_relative '../../test_helper'
 
describe CrawlBack::SEARCH do
  before do
    @search = CrawlBack::SEARCH.new("http://www.google.com", "test")
  end

  describe "Basic" do
    it "must return an array" do
      @search.results.must_be_instance_of Array
    end
  end
end