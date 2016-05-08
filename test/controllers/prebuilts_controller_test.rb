require 'test_helper'

class PrebuiltsControllerTest < ActionController::TestCase
  setup do
    @prebuilt = prebuilts(:one)
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
      post :create, prebuilt: { partlist: @prebuilt.partlist, performance: @prebuilt.performance, price: @prebuilt.price, type_build: @prebuilt.type_build }
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
    patch :update, id: @prebuilt, prebuilt: { partlist: @prebuilt.partlist, performance: @prebuilt.performance, price: @prebuilt.price, type_build: @prebuilt.type_build }
    assert_redirected_to prebuilt_path(assigns(:prebuilt))
  end

  test "should destroy prebuilt" do
    assert_difference('Prebuilt.count', -1) do
      delete :destroy, id: @prebuilt
    end

    assert_redirected_to prebuilts_path
  end
end
