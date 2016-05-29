require 'test_helper'

class ComputerCasesControllerTest < ActionController::TestCase
  setup do
    @computer_case = computer_cases(:one)
    login_admin
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:computer_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create computer_case" do
    assert_difference('ComputerCase.count') do
      post :create, computer_case: { dollar_price: @computer_case.dollar_price, euro_price: @computer_case.euro_price, link: @computer_case.link, name: @computer_case.name, performance: @computer_case.performance, size: @computer_case.size }
    end

    assert_redirected_to computer_case_path(assigns(:computer_case))
  end

  test "should show computer_case" do
    get :show, id: @computer_case
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @computer_case
    assert_response :success
  end

  test "should update computer_case" do
    patch :update, id: @computer_case, computer_case: { dollar_price: @computer_case.dollar_price, euro_price: @computer_case.euro_price, link: @computer_case.link, name: @computer_case.name, performance: @computer_case.performance, size: @computer_case.size }
    assert_redirected_to computer_case_path(assigns(:computer_case))
  end

  test "should destroy computer_case" do
    assert_difference('ComputerCase.count', -1) do
      delete :destroy, id: @computer_case
    end

    assert_redirected_to computer_cases_path
  end
end
