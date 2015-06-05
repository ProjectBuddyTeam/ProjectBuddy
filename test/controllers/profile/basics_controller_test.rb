require 'test_helper'

class Profile::BasicsControllerTest < ActionController::TestCase
  setup do
    @profile_basic = profile_basics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_basics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_basic" do
    assert_difference('Profile::Basic.count') do
      post :create, profile_basic: { deviantart: @profile_basic.deviantart, first_name: @profile_basic.first_name, github: @profile_basic.github, identity_member_id: @profile_basic.identity_member_id, last_name: @profile_basic.last_name }
    end

    assert_redirected_to profile_basic_path(assigns(:profile_basic))
  end

  test "should show profile_basic" do
    get :show, id: @profile_basic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_basic
    assert_response :success
  end

  test "should update profile_basic" do
    patch :update, id: @profile_basic, profile_basic: { deviantart: @profile_basic.deviantart, first_name: @profile_basic.first_name, github: @profile_basic.github, identity_member_id: @profile_basic.identity_member_id, last_name: @profile_basic.last_name }
    assert_redirected_to profile_basic_path(assigns(:profile_basic))
  end

  test "should destroy profile_basic" do
    assert_difference('Profile::Basic.count', -1) do
      delete :destroy, id: @profile_basic
    end

    assert_redirected_to profile_basics_path
  end
end
