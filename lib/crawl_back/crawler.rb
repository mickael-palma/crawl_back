require 'mechanize'

module CrawlBack
  class CRAWLER
    
    attr_accessor  :agent
    
    def initialize(url)
      @url = url

      # initialize agent
      @agent = Mechanize.new
      @agent.user_agent = 'CrawlBack'
    end
    
    def random_user_agent
      @agent.user_agent_alias = Mechanize::AGENT_ALIASES.keys.sample
    end

    def get
      @agent.get(@url)
    end
  end
end