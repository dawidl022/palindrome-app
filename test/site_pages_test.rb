require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    test_page_exists
  end

  def test_about
    get '/about'
    test_page_exists
  end

  def test_palindrome
    get '/palindrome'
    test_page_exists
  end
end
