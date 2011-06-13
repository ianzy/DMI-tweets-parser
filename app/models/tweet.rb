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
  
  def self.get_random_unparsed_tweet parsed='none'
    count = RAWS::SDB::Select.new.columns('COUNT(*)').from("db_knowledge").where('parsed = ?', [parsed]).first[1]["Count"].to_i
    offset = rand(count)
    offset += 1 if offset == 0
    # get the next token
    ret = RAWS::SDB::Adapter.select("select COUNT(*) from `db_knowledge` where parsed = ? limit #{offset}", [['none']], nil)\
      ['SelectResponse']['SelectResult']
    next_token = ret['NextToken']
    
    ret = RAWS::SDB::Adapter.select("select * from `db_knowledge` where parsed = ? limit 1", [['none']], next_token)\
      ['SelectResponse']['SelectResult']
    [ret['Item'][0]['Name'], ret['Item'][0]['Attribute']]
  end
  
  # a bad way to validate active resource model....
  def validate
    is_valid = true
    if people_name.nil? or people_name.empty?
      errors.add("people_name", "cannot be empty")
      is_valid = false
    end
    if address.nil? or address.empty?
      errors.add("address", "cannot be empty")
      is_valid = false
    end
    if category.nil? or category.empty?
      errors.add("category", "cannot be empty")
      is_valid = false
    end
    return true if is_valid
    false
  end
end
