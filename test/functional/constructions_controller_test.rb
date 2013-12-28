require 'test_helper'

class ConstructionsControllerTest < ActionController::TestCase
  setup do
    @construction = constructions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:constructions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create construction" do
    assert_difference('Construction.count') do
      post :create, construction: { delivery_date: @construction.delivery_date, start_date: @construction.start_date, user_id: @construction.user_id, vehicle_id: @construction.vehicle_id }
    end

    assert_redirected_to construction_path(assigns(:construction))
  end

  test "should show construction" do
    get :show, id: @construction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @construction
    assert_response :success
  end

  test "should update construction" do
    put :update, id: @construction, construction: { delivery_date: @construction.delivery_date, start_date: @construction.start_date, user_id: @construction.user_id, vehicle_id: @construction.vehicle_id }
    assert_redirected_to construction_path(assigns(:construction))
  end

  test "should destroy construction" do
    assert_difference('Construction.count', -1) do
      delete :destroy, id: @construction
    end

    assert_redirected_to constructions_path
  end
end
