require_relative '../../test_helper'

describe CrawlBack::CRAWLER do
  before do
    @crawler = CrawlBack::CRAWLER.new('http://www.google.com')
    @crawler.term          = "test"
    @crawler.field_options = {name: 'q'} # 'q' is the google form textfield name
    @crawler.form_options  = {name: 'f'} # 'f' is the google form name
    @crawler.product_page_url_pattern = /product/
    @crawler.product_page_dom_pattern = 'title' # CSS path
  end

  it 'must get a webpage' do
    @crawler.get.must_be_instance_of Mechanize::Page
  end

  it 'must have a default user agent' do
    @crawler.agent.user_agent.must_equal 'CrawlBack'
  end

  it 'must have a random user agent from AGENT_ALIASES' do
    Mechanize::AGENT_ALIASES.keys.must_include @crawler.random_user_agent
  end

  describe "the search must use the websiste search form" do
    it "must be a Mechanize form" do
      @crawler.search_form.must_be_instance_of Mechanize::Form
    end

    it "must submit the search form" do
      @crawler.submit_search_form.must_be_instance_of Mechanize::Page
    end
  end

  describe "Product Page" do
    it "must tell if it's a product page" do
      @crawler.product_page?.must_equal true
    end
  end
  
end