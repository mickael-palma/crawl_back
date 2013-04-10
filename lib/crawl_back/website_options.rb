module CrawlBack
  class WEBSITE_OPTIONS

    METHOD_WHITE_LIST = %w{ base_url form_name text_field }

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

    def method_missing(meth, *args, &block)
      if METHOD_WHITE_LIST.include?(meth.to_s)
        args.empty? ? instance_variable_get("@#{meth}") : instance_variable_set("@#{meth}", args.first)
      else
        super
      end
    end
  end

  # Create config classes
  class << self
    def class_creation
      Class.new(WEBSITE_OPTIONS) do
        def initialize(&block)
          instance_eval &block
        end
      end
    end
  end

  %w{ Config SearchForm }.each do |klass|
    Object.const_set(klass, class_creation)
  end
end