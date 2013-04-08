module CrawlBack
  class WEBSITE_OPTIONS

    attr_accessor :options

    def initialize(&block)
      @options = {}

      instance_eval &block
    end

    def config(&block)
      config = Config.new &block
      @options[:config] = { base_url: config.base_url }
    end

    def search_form(&block)
      form = SearchForm.new &block
      @options[:search_form]  = { form_name: form.form_name, text_field: form.text_field }
    end
  end

  class Config < WEBSITE_OPTIONS
    def initialize(&block)
      instance_eval &block
    end

    %w(base_url).each do |meth|
      define_method(meth) do |*args| 
        args.blank? ? instance_variable_get("@#{meth}") : instance_variable_set("@#{meth}", args.first)
      end
    end

  end

  class SearchForm < WEBSITE_OPTIONS

    def initialize(&block)
      instance_eval &block
    end

    %w(form_name text_field).each do |meth|
      define_method(meth) do |*args| 
        args.blank? ? instance_variable_get("@#{meth}") : instance_variable_set("@#{meth}", args.first)
      end
    end

  end    
end