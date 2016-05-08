require 'test_helper'

class MemoriesControllerTest < ActionController::TestCase
  setup do
    @memory = memories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memory" do
    assert_difference('Memory.count') do
      post :create, memory: { capacity: @memory.capacity, dollar_price: @memory.dollar_price, euro_price: @memory.euro_price, link: @memory.link, name: @memory.name, ram_type: @memory.ram_type, score: @memory.score, sticks: @memory.sticks }
    end

    assert_redirected_to memory_path(assigns(:memory))
  end

  test "should show memory" do
    get :show, id: @memory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memory
    assert_response :success
  end

  test "should update memory" do
    patch :update, id: @memory, memory: { capacity: @memory.capacity, dollar_price: @memory.dollar_price, euro_price: @memory.euro_price, link: @memory.link, name: @memory.name, ram_type: @memory.ram_type, score: @memory.score, sticks: @memory.sticks }
    assert_redirected_to memory_path(assigns(:memory))
  end

  test "should destroy memory" do
    assert_difference('Memory.count', -1) do
      delete :destroy, id: @memory
    end

    assert_redirected_to memories_path
  end
end
