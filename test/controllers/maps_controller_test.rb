require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @map = maps(:one)
    @adventure = adventures(:one)
    @user = users(:one)
    post login_path, params: {
      session: {
        user_id: @user.id,
        email: @user.email,
        password: 123456
      }
    }
  end

  test "name should be present" do
    @map.name = ""
    assert_not @map.valid?
  end

  test "story should be present" do
    @map.story = ""
    assert_not @map.valid?
  end

  test "should get new" do
    get new_user_adventure_map_path(user_id: @user.id, adventure_id: @adventure.id)
    assert_response :success
  end

  test "should create map" do
    assert_difference('Map.count') do
      post user_adventure_maps_url(user_id: @user.id, adventure_id: @adventure.id), params: { map: { data: @map.data, name: @map.name, story: @map.story, adventure: @adventure.id} }
    end

    assert_redirected_to edit_user_adventure_url(user_id: @user.id, id: @adventure.id)
  end

  test "should show map" do
    get user_adventure_map_url(user_id: @user.id, adventure_id: @adventure.id, id: @map.id)
    assert_response :success
  end

  test "should get edit" do
    get user_adventure_map_url(user_id: @user.id, adventure_id: @adventure.id, id: @map.id)
    assert_response :success
  end

  test "should update map" do
    patch user_adventure_map_url(user_id: @user.id, adventure_id: @adventure.id, id: @map.id), params: { map: { data: @map.data, name: @map.name } }
    assert_redirected_to edit_user_adventure_url(user_id: @user.id, id: @adventure.id)
  end

  test "should destroy map" do
    assert_difference('Map.count', -1) do
      delete user_adventure_map_url(user_id: @user.id, adventure_id: @adventure.id, id: @map.id)
    end

    assert_redirected_to user_adventure_maps_url(user_id: @user.id, adventure_id: @adventure.id)
  end
end
