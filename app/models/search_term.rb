class SearchTerm < ActiveResource::Base
  self.site   = "http://localhost:8888" # Proxy host + port
  self.prefix = "/db_search_keywords/"  # SDB domain
  
  attr_accessor :new_name
  
  def validate
    existing_terms = SearchTerm.find :all
    existing_terms.each do |term|
      if term.name == self.name
        errors.add(term.name, "already exist") 
        return false
      end
    end
    return true
  end
end
