class UrlParser
def initialize(url)
@url = url
puts @url
end


def scheme
    # 'http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat'.split(":").first
    # 'http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat'.split(":").last.split("/").first
    
    @scheme = @url.split(":").first
end

def port

    @scheme = @url.split(":").first
    @extractPort  = @url.split(":").last.split("/").first

    if @scheme == "http" && @extractPort == ''
      @port = "80"

    elsif @scheme == "https" &&  @extractPort == ''
      @port = "443"
    else @extractPort
    end
end


end