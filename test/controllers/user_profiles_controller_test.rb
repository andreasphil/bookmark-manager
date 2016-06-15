require 'test_helper'

class UserProfilesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user_profile = user_profiles(:one)
    sign_in users(:one)
  end

  test "should create user_profile" do
    assert_difference('UserProfile.count') do
      post :create, user_profile: { background_image: @user_profile.background_image, user_id: @user_profile.user_id }
    end
  end

  test "should get edit" do
    get :edit, id: @user_profile
    assert_response :success
  end

  test "should update user_profile" do
    patch :update, id: @user_profile, user_profile: { background_image: @user_profile.background_image, user_id: @user_profile.user_id }
  end

  test "should destroy user_profile" do
    assert_difference('UserProfile.count', -1) do
      delete :destroy, id: @user_profile
    end
  end
end
