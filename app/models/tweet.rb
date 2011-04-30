class Tweet < ActiveResource::Base
  self.site   = "http://localhost:8888" # Proxy host + port
  self.prefix = "/db_knowledge/"       # SDB domain
end
