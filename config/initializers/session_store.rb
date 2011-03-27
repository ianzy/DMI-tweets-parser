# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dmitweetsparser_session',
  :secret      => '6ac84d6fbb9fdc2175f2084f7e246e0b22f5cf62d9c48444c2f1736c8ff58e65f65735dbdc6c64272ea91896c4848e7d61f9b2e52112ef581aa3470d3655f997'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
