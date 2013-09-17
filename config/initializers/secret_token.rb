# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Monroe::Application.config.secret_key_base = '654af66464d2913467cb4f7a2faba41dc8d6cef252601e4a0139736034a33b13974b1a8f2c66ac5531c6bc649a9a55dfbe01a51e763145da2beff12940dde12c'
