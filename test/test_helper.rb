ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActionController::TestCase
  include Devise::TestHelpers

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

end


  class ActionDispatch::IntegrationTest
    include Capybara::DSL
  end
