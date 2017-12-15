require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  setup do

    @user = users(:one)
    post login_path, params: {
      session: {
        user_id: @user.id,
        email: @user.email,
        password: 123456
      }
    }
    byebug
    #log_in(@user)

    #@session = sessions(:one)

    @other_user = users(:two)
  end

  # test "should log in" do
  #   post login_path, params: {
  #     session: {
  #       email: @user.email,
  #       password: @user.password
  #     }
  #   }
  #   byebug
  #   assert_response :success
  # end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post '/users', params: {
        user: {
          username: "bob2",
          email: "bob2@bob.com",
          password: "abcdef",
          password_confirmation: "abcdef",
          admin: false
        }
      }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    byebug
    get user_path(@user)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_user_path(@user)
  #   assert_response :success
  # end
  #
  # test "should update user" do
  #   patch user_path(@user), params: { email: @user.email, username: @user.username, admin: false }
  #   assert_redirected_to user_path(assigns(:user))
  # end
  #
  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user)
  #   end
  #
  #   assert_redirected_to users_path
  # end
  #
  # test "should not allow the admin attribute to be edited via the web" do
  #   log_in_as(@other_user)
  #   assert_not @other_user.admin?
  #   patch user_path(@other_user), params: {
  #                                   user: { password:              FILL_IN,
  #                                           password_confirmation: FILL_IN,
  #                                           admin: FILL_IN } }
  #   assert_not @other_user.FILL_IN.admin?
  # end
end
