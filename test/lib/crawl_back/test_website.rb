require_relative '../../test_helper'
 
describe CrawlBack::WEBSITE do
  before do
    @good_url = CrawlBack::WEBSITE.new("http://www.google.com")
    @bad_url  = CrawlBack::WEBSITE.new("google.com")
    
    # we include 'product_page_url_pattern' to pass test
    @product_url = CrawlBack::WEBSITE.new("http://www.google.com/about/jobs/teams/product-management/", {product_page_url_pattern: /product/})
  end

  describe "Basic" do 
    it "must have a valid url" do
      @good_url.valid?.must_equal true
      @bad_url.valid?.must_equal false
    end

    it "must return a module name" do
      test_urls = { "http://www.google.com"      => "GoogleCom",
                    "http://www.google-test.com" => "GoogleTestCom",
                    "http://google-test.com"     => "GoogleTestCom"
                  }

      test_urls.each do |url, m_name|
        CrawlBack::WEBSITE.new(url).module_name.must_equal m_name
      end
    end

    it "won't return a module name when bad url" do
      bad_urls = %w{ "www" "http/www.google-test" "google-test.com" }

      bad_urls.each do |url|
        CrawlBack::WEBSITE.new(url).module_name.must_be_nil
      end
    end
  end

  describe "Product" do
    it "must tell if it's a product page" do
      @product_url.product_page?.must_equal true
      @bad_url.product_page?.must_equal false
      @good_url.product_page?.must_equal false
    end
  end
end