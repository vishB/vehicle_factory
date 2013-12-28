require 'test_helper'

class FuelsControllerTest < ActionController::TestCase
  setup do
    @fuel = fuels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fuels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fuel" do
    assert_difference('Fuel.count') do
      post :create, fuel: { engine_id: @fuel.engine_id, fuel_type: @fuel.fuel_type }
    end

    assert_redirected_to fuel_path(assigns(:fuel))
  end

  test "should show fuel" do
    get :show, id: @fuel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fuel
    assert_response :success
  end

  test "should update fuel" do
    put :update, id: @fuel, fuel: { engine_id: @fuel.engine_id, fuel_type: @fuel.fuel_type }
    assert_redirected_to fuel_path(assigns(:fuel))
  end

  test "should destroy fuel" do
    assert_difference('Fuel.count', -1) do
      delete :destroy, id: @fuel
    end

    assert_redirected_to fuels_path
  end
end
