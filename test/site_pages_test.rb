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

  def test_form_presence
    get '/palindrome'
    assert doc(last_response).at_css('form')
  end

  def test_non_palindrome_submission
    post '/check', phrase: "Not a palindrome"
    response_content = doc(last_response).at_css('p').content
    assert_includes response_content, "isn't a palindrome"

    assert doc(last_response).at_css('form')
  end

  def test_palindrome_submission
    post '/check', phrase: 'Able was I, ere I saw Elba.'
    response_content = doc(last_response).at_css('p').content
    assert_includes response_content, "is a palindrome"
  end
end
