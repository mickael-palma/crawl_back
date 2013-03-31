require 'active_model'
require 'uri'

module CrawlBack
  class WEBSITE
    include ActiveModel::Validations

    attr_accessor :url

    def initialize(url)
      @url    = url
      @errors = ActiveModel::Errors.new(self)
    end

    validates :url, :format => { :with => URI::regexp }

    def module_name
      URL.new(@url).extract_module_name if valid?
    end

    def search(term)
      SEARCH.new(@url, term).results
    end
  end
end
