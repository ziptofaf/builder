require 'test_helper'

class PrebuiltsControllerTest < ActionController::TestCase
  setup do
    @prebuilt = prebuilts(:one)
    login_admin

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prebuilts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prebuilt" do
    assert_difference('Prebuilt.count') do
      post :create, prebuilt: { processor_id: @prebuilt.processor_id, motherboard_id: @prebuilt.motherboard_id, drive_id: @prebuilt.drive_id, graphic_id: @prebuilt.graphic_id, computer_case_id: @prebuilt.computer_case_id, power_supply_id: @prebuilt.power_supply_id, memory_id: @prebuilt.memory_id, performance: @prebuilt.performance, price: @prebuilt.price, type_build: @prebuilt.type_build }
    end

    assert_redirected_to prebuilt_path(assigns(:prebuilt))
  end

  test "should show prebuilt" do
    get :show, id: @prebuilt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prebuilt
    assert_response :success
  end

  test "should update prebuilt" do
    patch :update, id: @prebuilt, prebuilt: { processor_id: @prebuilt.processor_id, motherboard_id: @prebuilt.motherboard_id, drive_id: @prebuilt.drive_id, graphic_id: @prebuilt.graphic_id, computer_case_id: @prebuilt.computer_case_id, power_supply_id: @prebuilt.power_supply_id, memory_id: @prebuilt.memory_id, performance: @prebuilt.performance, price: @prebuilt.price, type_build: @prebuilt.type_build }
    assert_redirected_to prebuilt_path(assigns(:prebuilt))
  end

  test "should destroy prebuilt" do
    assert_difference('Prebuilt.count', -1) do
      delete :destroy, id: @prebuilt
    end

    assert_redirected_to prebuilts_path
  end
end
