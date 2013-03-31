module CrawlBack
  class URL
    
    attr_accessor :url

    def initialize(url)
      @url = url
    end

    def parsed_url
      URI.parse(@url)
    end

    def extract_module_name
      parsed_url.host.gsub('www.', '').split(/[^a-z0-9]/i).map { |e| e.capitalize }.join
    end
  end
end