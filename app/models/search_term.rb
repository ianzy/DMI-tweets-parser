class SearchTerm < ActiveResource::Base
  self.site   = "http://localhost:8888" # Proxy host + port
  self.prefix = "/db_search_keywords/"  # SDB domain
  
  attr_accessor :new_name
end
