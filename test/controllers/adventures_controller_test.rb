require 'test_helper'

class AdventuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post login_path, params: {
      session: {
        user_id: @user.id,
        email: @user.email,
        password: 123456
      }
    }
    @adventure = adventures(:one)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get new" do
    get new_user_adventure_url(user_id: @user.id)
    assert_response :success
  end

  test "should create adventure" do
    assert_difference('Adventure.count') do
      post user_adventures_url(user_id: @user.id), params: { adventure: { story: @adventure.story, title: @adventure.title, user_id: @adventure.user_id id: @adventure.id } }
    end
    byebug

    assert_redirected_to edit_user_adventure_url(user_id: @user.id, id: @adventure.id)
  end

  # test "should show adventure" do
  #   get adventure_url(@adventure)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_adventure_url(@adventure)
  #   assert_response :success
  # end
  #
  # test "should update adventure" do
  #   patch adventure_url(@adventure), params: { adventure: { story: @adventure.story, title: @adventure.title, user_id: @adventure.user_id } }
  #   assert_redirected_to user_url(@adventure.user_id)
  #   assert_redirected_to adventure_url(@adventure)
  #
  # test "should update adventure with correct redirect" do
  #   patch adventure_url(@adventure), params: { adventure: { story: @adventure.story, title: @adventure.title, user_id: @adventure.user_id } }
  #   assert_redirected_to user_url(@adventure.user_id)
  # end
  #
  # test "should destroy adventure" do
  #   assert_difference('Adventure.count', -1) do
  #     delete adventure_url(@adventure)
  #   end
  #   assert_redirected_to adventures_url
  # end

end
