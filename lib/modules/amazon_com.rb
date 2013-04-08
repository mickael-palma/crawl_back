module CrawlBack
  AmazonCom = WEBSITE_OPTIONS.new do
    config do
      base_url 'http://www.amazon.com'
    end

    search_form do
      form_name  'field-keywords'
      text_field 'site-search'
    end
    
    #search_page do
    #  title       css: 'h3', action: Proc.new { gsub(',', '') }
    #  link        css: 'h3 a', attribute: 'href'
    #  #brand       
    #  #category
    #  #price
    #  #sale_price
    #  #medias
    #end
    #
    #product_page do
    #  title css: 'h1'
    #  #brand
    #  #category
    #  #link
    #  #price
    #  #sale_price
    #  #condition
    #  #ean
    #  #medias
    #  #mpn
    #  #isbn
    #  #color
    #  #shipping_price
    #  #size
    #  #availability
    #  #online_only
    #  #review_score
    #  #description :default
    #end
  end
end
