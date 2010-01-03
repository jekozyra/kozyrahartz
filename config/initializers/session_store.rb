# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kozyrahartz_session',
  :secret      => '050fd524a9ecbad7195ec4bc4a29654059368392c52d7210e9f15baace9700ac24dfff73f456512da1ff8369fa8d02095ce7e70aa8144ff99b301b3ac6166868'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
