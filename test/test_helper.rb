ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

include Devise::TestHelpers
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def login_admin
    sign_in find_admin
  end

  def find_admin
    user = User.find_by email: "admin@example.com"
    return user
  end
  # Add more helper methods to be used by all tests here...
  class ActionDispatch::IntegrationTest
    # Make the Capybara DSL available in all integration tests
    include Capybara::DSL
  end
end
