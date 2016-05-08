require 'test_helper'

class DrivesControllerTest < ActionController::TestCase
  setup do
    @drife = drives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drife" do
    assert_difference('Drive.count') do
      post :create, drife: { capacity: @drife.capacity, disk_type: @drife.disk_type, dollar_price: @drife.dollar_price, euro_price: @drife.euro_price, link: @drife.link, name: @drife.name, performance: @drife.performance }
    end

    assert_redirected_to drife_path(assigns(:drife))
  end

  test "should show drife" do
    get :show, id: @drife
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drife
    assert_response :success
  end

  test "should update drife" do
    patch :update, id: @drife, drife: { capacity: @drife.capacity, disk_type: @drife.disk_type, dollar_price: @drife.dollar_price, euro_price: @drife.euro_price, link: @drife.link, name: @drife.name, performance: @drife.performance }
    assert_redirected_to drife_path(assigns(:drife))
  end

  test "should destroy drife" do
    assert_difference('Drive.count', -1) do
      delete :destroy, id: @drife
    end

    assert_redirected_to drives_path
  end
end
