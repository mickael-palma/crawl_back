module CrawlBack
  class SEARCH

    attr_accessor :url, :term, :results

    def initialize(url, term)
      @url  = url
      @term = term
      @results = []
    end
  end
end