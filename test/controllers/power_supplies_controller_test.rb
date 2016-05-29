require 'test_helper'

class PowerSuppliesControllerTest < ActionController::TestCase
  setup do
    @power_supply = power_supplies(:one)
    login_admin

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:power_supplies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create power_supply" do
    assert_difference('PowerSupply.count') do
      post :create, power_supply: { dollar_price: @power_supply.dollar_price, euro_price: @power_supply.euro_price, link: @power_supply.link, name: @power_supply.name, performance: @power_supply.performance, power: @power_supply.power }
    end

    assert_redirected_to power_supply_path(assigns(:power_supply))
  end

  test "should show power_supply" do
    get :show, id: @power_supply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @power_supply
    assert_response :success
  end

  test "should update power_supply" do
    patch :update, id: @power_supply, power_supply: { dollar_price: @power_supply.dollar_price, euro_price: @power_supply.euro_price, link: @power_supply.link, name: @power_supply.name, performance: @power_supply.performance, power: @power_supply.power }
    assert_redirected_to power_supply_path(assigns(:power_supply))
  end

  test "should destroy power_supply" do
    assert_difference('PowerSupply.count', -1) do
      delete :destroy, id: @power_supply
    end

    assert_redirected_to power_supplies_path
  end
end
