require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post login_path, params: {
      session: {
        user_id: @user.id,
        email: @user.email,
        password: 123456
      }
    }
    @character = characters(:one)
  end

  test "should get index" do
    get user_characters_url(@character)
    assert_response :success
  end

  test "should get new" do

    get new_user_character_url(user_id: @user.id)
    assert_response :success
  end

  test "should create character" do
    assert_difference('Character.count') do
      post user_characters_url(user_id: @user.id, id: @character.id), params: { character: { charisma: @character.charisma, constitution: @character.constitution, dexterity: @character.dexterity, intelligence: @character.intelligence, level: @character.level, name: @character.name, profession: @character.profession, race: @character.race, strength: @character.strength, wisdom: @character.wisdom } }
    end

    assert_redirected_to user_url(@user)
  end

  test "should show character" do
    byebug
    get user_character_url(user_id: @user.id, id: @character.id)
    assert_response :success
  end
  #
  # test "should get edit" do
  #   get edit_user_character_url(@character)
  #   assert_response :success
  # end
  #
  # test "should update character" do
  #   patch user_character_url(@character), params: { character: { charisma: @character.charisma, constitution: @character.constitution, dexterity: @character.dexterity, intelligence: @character.intelligence, level: @character.level, name: @character.name, profession: @character.profession, race: @character.race, strength: @character.strength, wisdom: @character.wisdom } }
  #   assert_redirected_to user_character_url(@character)
  # end
  #
  # test "should destroy character" do
  #   assert_difference('Character.count', -1) do
  #     delete user_character_url(@character)
  #   end
  #
  #   assert_redirected_to user_characters_url
  # end
end
