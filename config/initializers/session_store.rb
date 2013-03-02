# Be sure to restart your server when you modify this file.

Movtriv::Application.config.session_store :upgrade_signature_to_encryption_cookie_store, key: '_movtriv_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Movtriv::Application.config.session_store :active_record_store
