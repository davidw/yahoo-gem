require 'test/unit'
require 'rubygems'
require 'rc_rest/uri_stub'
require 'yahoo'

class Yahoo::Test < Yahoo

  def initialize(*args)
    @host = 'api.test.yahoo.com'
    @service_name = 'TestService'
    @version = 'Vtest'
    super
  end

  def test
    get :test, :test_param => 5
  end

  def parse_response(xml)
    return xml
  end

end

class TestYahoo < Test::Unit::TestCase

  def setup
    URI::HTTP.responses = []
    URI::HTTP.uris = []

    @t = Yahoo::Test.new 'APP_ID'
  end

  def test_check_error
    xml = Nokogiri::XML '<Error><Message>you broked it</Message></Error>'
    @t.check_error xml

  rescue Yahoo::Error => e
    assert_equal 'you broked it', e.message

  else
    flunk 'expected an error'
  end

  def test_make_url
    url = @t.make_url :test, :param => 'value'

    expected = 'http://api.test.yahoo.com/TestService/Vtest/test?appid=APP_ID&output=xml&param=value'

    assert_equal expected, url.to_s
  end

end

