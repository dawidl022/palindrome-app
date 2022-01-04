require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    @base_title = "Learn Enough Ruby Sample App |"
  end

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    test_page_exists
    assert_equal "#{@base_title} Home", title_content
    test_nav
  end

  def test_about
    get '/about'
    test_page_exists
    assert_equal "#{@base_title} About", title_content
  end

  def test_palindrome
    get '/palindrome'
    test_page_exists
    assert_equal "#{@base_title} Palindrome Detector", title_content
  end
end
