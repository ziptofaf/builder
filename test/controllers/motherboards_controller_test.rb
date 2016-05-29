require 'test_helper'

class MotherboardsControllerTest < ActionController::TestCase
  setup do
    @motherboard = motherboards(:one)
    login_admin

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motherboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motherboard" do
    assert_difference('Motherboard.count') do
      post :create, motherboard: { OC: @motherboard.OC, dollar_price: @motherboard.dollar_price, euro_price: @motherboard.euro_price, link: @motherboard.link, name: @motherboard.name, platform_id: @motherboard.platform_id, ram_slots: @motherboard.ram_slots, score: @motherboard.score, size: @motherboard.size }
    end

    assert_redirected_to motherboard_path(assigns(:motherboard))
  end

  test "should show motherboard" do
    get :show, id: @motherboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motherboard
    assert_response :success
  end

  test "should update motherboard" do
    patch :update, id: @motherboard, motherboard: { OC: @motherboard.OC, dollar_price: @motherboard.dollar_price, euro_price: @motherboard.euro_price, link: @motherboard.link, name: @motherboard.name, platform_id: @motherboard.platform_id, ram_slots: @motherboard.ram_slots, score: @motherboard.score, size: @motherboard.size }
    assert_redirected_to motherboard_path(assigns(:motherboard))
  end

  test "should destroy motherboard" do
    assert_difference('Motherboard.count', -1) do
      delete :destroy, id: @motherboard
    end

    assert_redirected_to motherboards_path
  end
end
