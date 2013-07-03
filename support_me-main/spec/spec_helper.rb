require 'simplecov'
require 'vcr'

SimpleCov.start do
  add_filter "/spec"
  add_filter "/config"
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# require 'capybara/poltergeist'
# Capybara.javascript_driver = :poltergeist
Capybara.javascript_driver = :webkit

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/vcr_cassettes'
  c.allow_http_connections_when_no_cassette = true
  c.hook_into :faraday # or :fakeweb
end

RSpec.configure do |config|
  config.include Sorcery::TestHelpers::Rails
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.use_transactional_fixtures = true
end
