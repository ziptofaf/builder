require 'test_helper'

class MakerControllerTest < ActionController::TestCase
  test "should get build" do
    get :build
    assert_response :success
  end

end
