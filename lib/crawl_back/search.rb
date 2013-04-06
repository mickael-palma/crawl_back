module CrawlBack
  class SEARCH

    attr_accessor :url, :term

    def initialize(url, options={})
      @url  = url
      @term = options[:term]
    end

    def results
      CRAWLER.new(url, term: @term).results
    end
  end
end