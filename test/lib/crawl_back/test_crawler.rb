require_relative '../../test_helper'

describe CrawlBack::CRAWLER do
  before do
    @crawler = CrawlBack::CRAWLER.new('http://www.google.com')
  end

  it 'must get a webpage' do
    @crawler.get.must_be_instance_of Mechanize::Page
  end

  it 'must have a default user agent' do
    @crawler.agent.user_agent.must_equal 'CrawlBack'
  end

  it 'must have a user agent from AGENT_ALIASES' do
    Mechanize::AGENT_ALIASES.keys.must_include @crawler.random_user_agent
  end
  
end