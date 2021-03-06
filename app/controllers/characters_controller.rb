class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    # @characters = current_user.characters
    @characters = Character.where('user_id = ?', current_user.id)
    @user = current_user
    @character = Character.new

  end

  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.new
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)
    @character.user_id = current_user.id

    @character.user = current_user
    @user = @character.user

    respond_to do |format|
      if @character.save
        format.html { redirect_to user_path(current_user), notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to user_characters_path(user_id: @character.user.id), notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.adventures.each do |adventure|
      adventure.characters.delete(@character)
      adventure.remove_character @character
    end
    @user = @character.user
    @character.destroy
    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :backstory, :profession, :level, :race, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma)
    end
end
