require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  test "should get list" do
    login_admin
    get :list
    assert_response :success
  end

end
