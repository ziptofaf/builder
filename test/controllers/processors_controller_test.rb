require 'test_helper'

class ProcessorsControllerTest < ActionController::TestCase
  setup do
    @processor = processors(:one)
    login_admin

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor" do
    assert_difference('Processor.count') do
      post :create, processor: { OC: @processor.OC, average: @processor.average, dollar_price: @processor.dollar_price, euro_price: @processor.euro_price, iGPU: @processor.iGPU, link: @processor.link, multi: @processor.multi, name: @processor.name, platform_id: @processor.platform_id, power: @processor.power, single: @processor.single }
    end

    assert_redirected_to processor_path(assigns(:processor))
  end

  test "should show processor" do
    get :show, id: @processor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor
    assert_response :success
  end

  test "should update processor" do
    patch :update, id: @processor, processor: { OC: @processor.OC, average: @processor.average, dollar_price: @processor.dollar_price, euro_price: @processor.euro_price, iGPU: @processor.iGPU, link: @processor.link, multi: @processor.multi, name: @processor.name, platform_id: @processor.platform_id, power: @processor.power, single: @processor.single }
    assert_redirected_to processor_path(assigns(:processor))
  end

  test "should destroy processor" do
    assert_difference('Processor.count', -1) do
      delete :destroy, id: @processor
    end

    assert_redirected_to processors_path
  end
end
