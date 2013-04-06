module CrawlBack
  class URL
    
    attr_accessor :url

    def initialize(url)
      @url = url
    end

    def parsed_url
      URI.parse(@url)
    end

    def module_name
      ModuleNameExtractor.new(parsed_url.host).module_name
    end
  end
end