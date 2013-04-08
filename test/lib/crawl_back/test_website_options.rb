require_relative '../../test_helper'

describe CrawlBack::WEBSITE_OPTIONS do
  before do
    @website_opts = CrawlBack::AmazonCom.options
  end

  it "must have a base_url" do
    @website_opts[:config][:base_url].must_equal "http://www.amazon.com"
  end

  it "must have a search form name" do
    @website_opts[:search_form][:form_name].must_equal 'field-keywords'
  end
  
  it "must have a search form text_field" do
    @website_opts[:search_form][:text_field].must_equal 'site-search'
  end
end