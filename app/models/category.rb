class Category < ActiveResource::Base
  self.site   = "http://localhost:8888" # Proxy host + port
  self.prefix = "/db_category/"       # SDB domain
  
  attr_accessor :new_name
end
