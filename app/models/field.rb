class Field < ActiveResource::Base
  self.site   = "http://localhost:8888" # Proxy host + port
  self.prefix = "/db_fields/"  # SDB domain
  
  attr_accessor :new_name
  
  def validate
    existing_fields = Field.find :all
    existing_fields.each do |field|
      if field.name == self.name
        errors.add(field.name, "already exist") 
        return false
      end
    end
    return true
  end
end
