require 'uri'
require 'cgi'

class UrlParser

def initialize(url)
@url = url
puts @url
end

def scheme
        
    @scheme = @url.split(":").first
end

def port

    scheme = @url.split(":").first
    extractPort  = @url.split(":").last.split("/").first

    if scheme == "http" && extractPort == ''
      port = "80"

    elsif scheme == "https" &&  extractPort == ''
      port = "443"
    else extractPort
    end
end

def domain
  @uri = URI.parse(@url)
  @uri.host

end

def fragment_id
  @url.split("#").last
end

def path
path = @url.split("?").first.split("//").last.split("/") 

if path.length > 1
  path.last
  else nil
  end

end

def query_string

  query = @url.split("?").last.split("#").first

  hashOne = query.split("&").first
  keyOne = "#{hashOne.split("=").first}"
  first_value = "#{hashOne.split("=").last}"

  hashTwo = query.split("&").last
  keyTwo = "#{hashTwo.split("=").first}"
  second_value = "#{hashTwo.split("=").last}"

  if hashTwo == ""
    @query_string = {keyOne => first_value}
  elsif keyOne == keyTwo
    @query_string = {keyTwo => second_value}
  else
    @query_string = {keyOne => first_value, keyTwo => second_value}
  end
return @query_string

end

end
