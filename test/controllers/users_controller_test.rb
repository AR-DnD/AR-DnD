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
    @other_user = users(:two)
  end

  test "should log in" do
    post login_path, params: {
      session: {
        user_id: @user.id,
        email: @user.email,
        password: 123456
      }
    }
    assert_redirected_to user_url(@user.id)
  end

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
    get user_path(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_path(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_path(@user), params: {
        user: {
          email: @user.email,
          username: @user.username,
          admin: false
        }
       }
    assert_response :success
  end

  test "should not allow the admin attribute to be edited via the web" do
    #log_in_as(@other_user)
    post login_path, params: {
      session: {
        user_id: @other_user.id,
        email: @other_user.email,
        password: 123456
      }
    }
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                    user: { password:              123456,
                                            password_confirmation: 123456,
                                            admin: true } }
    assert_not @other_user.admin?
  end
end
