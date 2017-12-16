require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    @user = users(:one)
    post login_path, params: {
      session: {
        user_id: @user.id,
        email: @user.email,
        password: 123456
      }
    }
    assert_redirected_to user_url(@user.id)
  end
end
