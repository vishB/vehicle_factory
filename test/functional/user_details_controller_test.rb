require 'test_helper'

class UserDetailsControllerTest < ActionController::TestCase
  setup do
    @user_detail = user_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_details)
    Warden.test_reset! 
  end

  test "should get new" do
    get :new
    assert_response :success
    Warden.test_reset! 
  end

  test "should create user_detail" do
    assert_difference('UserDetail.count') do
      post :create, user_detail: { age: @user_detail.age, email: @user_detail.email, first_name: @user_detail.first_name, last_name: @user_detail.last_name, phone: @user_detail.phone, sex: @user_detail.sex, user_id: @user_detail.user_id }
    end

    assert_redirected_to user_detail_path(assigns(:user_detail))
    Warden.test_reset! 
  end

  test "should show user_detail" do
    get :show, id: @user_detail
    assert_response :success
    Warden.test_reset! 
  end

  test "should get edit" do
    get :edit, id: @user_detail
    assert_response :success
    Warden.test_reset! 
  end

  test "should update user_detail" do
    put :update, id: @user_detail, user_detail: { age: @user_detail.age, email: @user_detail.email, first_name: @user_detail.first_name, last_name: @user_detail.last_name, phone: @user_detail.phone, sex: @user_detail.sex, user_id: @user_detail.user_id }
    assert_redirected_to user_detail_path(assigns(:user_detail))
    Warden.test_reset! 
  end

  test "should destroy user_detail" do
    assert_difference('UserDetail.count', -1) do
      delete :destroy, id: @user_detail
    end

    assert_redirected_to user_details_path
    Warden.test_reset! 
  end
end
