require 'mechanize'

module CrawlBack
  class CRAWLER

    attr_accessor :agent,
                  :term, :field_options, :form_options,
                  :product_page_url_pattern, :product_page_dom_pattern

    def initialize(url, options={})
      @url = url

      # initialize agent
      @agent = Mechanize.new
      @agent.user_agent = 'CrawlBack'

      # search form details
      @term          = options[:term]
      @field_options = options[:field_options]
      @form_options  = options[:form_options]

      # product page details
      @product_page_url_pattern = options[:product_page_url_pattern]
      @product_page_dom_pattern = options[:product_page_dom_pattern]
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

    def product_page?
      product_page_match_url_pattern? or product_page_match_dom_pattern?
    end

    def product_page_match_url_pattern?
      unless @product_page_url_pattern.blank?
        @url =~ @product_page_url_pattern ? true : false
      else
        false
      end
    end

    def product_page_match_dom_pattern?
      unless @product_page_dom_pattern.blank?
        get.search(@product_page_dom_pattern).size > 0 ? true : false
      else
        false
      end
    end

  end
end