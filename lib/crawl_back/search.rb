module CrawlBack
  class SEARCH

    attr_accessor :url, :term, :options

    def initialize(url, options={})
      @url     = url
      @term    = options[:term]
      @options = options
    end

    def results
      CRAWLER.new(url, @options).results
    end
  end
end