# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
ChatService::Application.config.secret_key_base = 'c4bccee7817c55933b88311090b9057393d529f3f97b646db7076ad5676cae2a2a6915e47d1df8e2e1c8b054326d6c4afd04ba66cfa6ddca83b8f78204ac7998'
