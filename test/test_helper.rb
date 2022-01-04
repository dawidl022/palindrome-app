ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'rack/test'
require 'nokogiri'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

# Returns the document.
def doc(response)
  Nokogiri::HTML(response.body)
end

def test_page_exists
  assert last_response.ok?
  assert doc(last_response).at_css('h1')
end

def title_content
  doc(last_response).at_css('title').content
end

def test_nav
  assert doc(last_response).at_css('nav')
end
