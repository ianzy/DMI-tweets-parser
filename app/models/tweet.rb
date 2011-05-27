require 'rubygems'
require 'raws'

class Tweet < ActiveResource::Base
  self.site   = "http://localhost:8888" # Proxy host + port
  self.prefix = "/db_knowledge/"       # SDB domain
  
  RAWS.aws_access_key_id = "AKIAJ77EM7MALMT3WOPA"
  RAWS.aws_secret_access_key = "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"
  
  def self.find_by_parsed parsed='none', limit=1
    RAWS::SDB::Select.new.columns('*').from("db_knowledge").where('parsed = ?', [parsed]).limit(limit)
  end
end
