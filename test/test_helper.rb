ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'


class RequestSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers

  # Add more helper methods to be used by all tests here...
end
