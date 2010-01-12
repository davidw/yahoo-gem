require 'rubygems'
require 'rc_rest'
require 'nokogiri'

##
# Abstract class for implementing Yahoo APIs.
#
# http://developer.yahoo.com/

class Yahoo < RCRest

  ##
  # This is the version of Yahoo you are using.

  VERSION = '1.1.1'

  ##
  # Yahoo error class.

  class Error < RCRest::Error; end

  ##
  # Web services initializer.
  #
  # The +appid+ is the Application ID that uniquely identifies your
  # application.  See: http://developer.yahoo.com/faq/index.html#appid
  #
  # Concrete web services implementations need to set the following instance
  # variables then call super:
  #
  # +host+:: API endpoint hostname
  # +service_name+:: service name
  # +version+:: service name version number
  #
  # See http://developer.yahoo.com/search/rest.html

  def initialize(appid)
    @appid = appid
    @url = URI.parse "http://#{@host}/#{@service_name}/#{@version}/"
  end

  def check_error(xml) # :nodoc:
    err = xml.at_xpath('Error')
    raise Error, err.at_xpath('Message').content if err
  end

  def make_url(method, params) # :nodoc:
    params[:appid] = @appid
    params[:output] = 'xml'

    super method, params
  end

end

