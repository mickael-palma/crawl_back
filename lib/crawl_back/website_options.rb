module CrawlBack
  class WEBSITE_OPTIONS

    attr_accessor :options

    def initialize(&block)
      @options = {}

      instance_eval &block
    end

    def config(&block)
      config = Config.new &block
      @options[:config] = { base_url: config.options[:base_url] }
    end

    def search_form(&block)
      form = SearchForm.new &block
      @options[:search_form]  = { form_name: form.options[:form_name], text_field: form.options[:text_field] }
    end
  end

  class Config < WEBSITE_OPTIONS
    
    attr_accessor :options

    def initialize(&block)
      @options = {}

      instance_eval &block
    end

    %w(base_url).each do |meth|
      define_method(meth) { |arg| @options[meth.to_sym] = arg }
    end

  end

  class SearchForm < WEBSITE_OPTIONS

    attr_accessor :options

    def initialize(&block)
      @options = {}

      instance_eval &block
    end

    %w(form_name text_field).each do |meth|
      define_method(meth) { |arg| @options[meth.to_sym] = arg }
    end

  end    
end