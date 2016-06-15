require 'uri'

module BookmarksHelper
  def get_favicon_url (url)
    uri = URI.parse 'http://www.google.com/s2/favicons'
    uri.query = URI.encode_www_form domain_url: url
    uri
  end
end
