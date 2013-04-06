require 'mechanize'

module CrawlBack
  class CRAWLER

    attr_accessor :agent, :field_options, :form_options, :term

    def initialize(url, options={})
      @url = url

      # initialize agent
      @agent = Mechanize.new
      @agent.user_agent = 'CrawlBack'

      # search form details
      @term          = options[:term]
      @field_options = options[:field_options]
      @form_options  = options[:form_options]
    end
    
    def random_user_agent
      @agent.user_agent_alias = Mechanize::AGENT_ALIASES.keys.sample
    end

    def get
      @agent.get(@url)
    end

    def search_form
      get.form_with @form_options
    end

    def submit_search_form
      search_form.field_with(@field_options).value = @term
      @agent.submit search_form
    end
    alias_method  :results, :submit_search_form
    
  end
end