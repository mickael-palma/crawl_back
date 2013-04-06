module CrawlBack
  class ModuleNameExtractor
    def initialize(name)
      @name = name
    end

    def remove_www
      @name.gsub('www.', '')
    end

    def keep_anum
      remove_www.split(/[^a-z0-9]/i)
    end

    def capitalized_join
      keep_anum.map { |e| e.capitalize }.join
    end

    def underscored_join
      keep_anum.join('_')
    end
    
    def module_name
      capitalized_join
    end

    def module_filename
      underscored_join
    end
  end
end