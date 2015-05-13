require 'json'

class VersionFetcher
  
  def initialize(name)
    @name = name
  end

  def fetch
    result = `curl --silent https://rubygems.org/api/v1/versions/#{@name}.json`
    json = JSON.parse(result).map {|s| s['number']}
    json
  end

end



#require 'json'
#
#class VersionFetcher
  
#  def initialize(name)
#    @name = name
#  end

#  def fetch
#    result = `curl --silent https://rubygems.org/api/v1/versions/#{@name}.json`
#    json = JSON.parse(result).map {|s| s['number']}
#    json
#  end

#end
