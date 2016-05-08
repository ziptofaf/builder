require 'test_helper'

class GraphicsControllerTest < ActionController::TestCase
  setup do
    @graphic = graphics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:graphics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create graphic" do
    assert_difference('Graphic.count') do
      post :create, graphic: { cpu_average: @graphic.cpu_average, dollar_price: @graphic.dollar_price, euro_price: @graphic.euro_price, link: @graphic.link, name: @graphic.name, performance: @graphic.performance, power: @graphic.power, size: @graphic.size }
    end

    assert_redirected_to graphic_path(assigns(:graphic))
  end

  test "should show graphic" do
    get :show, id: @graphic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @graphic
    assert_response :success
  end

  test "should update graphic" do
    patch :update, id: @graphic, graphic: { cpu_average: @graphic.cpu_average, dollar_price: @graphic.dollar_price, euro_price: @graphic.euro_price, link: @graphic.link, name: @graphic.name, performance: @graphic.performance, power: @graphic.power, size: @graphic.size }
    assert_redirected_to graphic_path(assigns(:graphic))
  end

  test "should destroy graphic" do
    assert_difference('Graphic.count', -1) do
      delete :destroy, id: @graphic
    end

    assert_redirected_to graphics_path
  end
end
