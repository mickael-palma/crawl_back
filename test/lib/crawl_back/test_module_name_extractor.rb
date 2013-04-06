require_relative '../../test_helper'

describe CrawlBack::ModuleNameExtractor do
  before do
    @name = CrawlBack::ModuleNameExtractor.new('www.google.com')
  end

  it 'must remove WWW' do
    @name.remove_www.must_equal 'google.com'
  end

  it 'must keep alpha numeric characters' do
    @name.keep_anum.must_equal ['google', 'com']
  end

  it 'must join capitalized parts' do
    @name.capitalized_join.must_equal "GoogleCom"
  end

  it 'must join parts with underscores' do
    @name.underscored_join.must_equal "google_com"
  end

  it 'must extract a module name' do
    @name.module_name.must_equal "GoogleCom"
  end

  it 'must extract a module filename' do
    @name.module_filename.must_equal "google_com"
  end
end