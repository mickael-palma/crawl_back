require 'active_model'
require 'uri'

module CrawlBack
  class WEBSITE
    include ActiveModel::Validations

    attr_accessor :url

    def initialize(url, options={})
      @url    = url
      @options = options
      @errors = ActiveModel::Errors.new(self)
    end

    validates :url, format: { with: URI::regexp }

    def module_name
      URL.new(@url).module_name if valid?
    end

    def search(term)
      SEARCH.new(@url, term: term).results
    end

    def product_page?
      valid? ? CRAWLER.new(@url, @options).product_page? : false
    end

  end
end
