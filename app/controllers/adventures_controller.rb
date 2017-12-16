class AdventuresController < ApplicationController
  before_action :set_adventure, only: [:show, :edit, :update, :destroy, :copy]

  def switch_characters
    adventure = Adventure.find(params["adventure id"])
    params["/switch_characters"].each do |character,selected|
      character = Character.find(character)
      if character.adventures.exists?(adventure.id) && selected == "0"
        character.adventures.delete(adventure)
      elsif !character.adventures.exists?(adventure.id) && selected == "1"
        character.adventures << adventure
      end

    end
  end

  def copy
    @copy = @adventure.make_copy current_user
    current_user.adventures << @copy
    @copy.copy_maps @adventure
    redirect_to edit_user_adventure_path(@copy, user_id: @adventure.user.id), notice: 'Adventure was successfully saved.'
  end

  def index
    # @adventures = Adventure.all
    @adventures = current_user.adventures
    @adventure = Adventure.new

  end

  def show
  end

  def new
    @adventure = Adventure.new
  end

  def edit
  end

  def create
    @adventure = Adventure.new(adventure_params)
    if params[:characters]
      params[:characters].each do |character_id|
        @adventure.characters << Character.find(character_id.to_i)
      end
    end
    @adventure.user = current_user
    @adventure.times_copied = 0
    respond_to do |format|
      if @adventure.save
        format.html { redirect_to edit_user_adventure_path(id: @adventure.id, user_id: @adventure.user.id), notice: 'Adventure was successfully created.' }
        format.json { render :show, status: :created, location: @adventure }
      else
        format.html { render :new }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @adventure.update(adventure_params)
        format.html { redirect_to user_path(id: @adventure.user.id), notice: 'Adventure was successfully updated.' }
        format.json { render :show, status: :ok, location: @adventure }
      else
        format.html { render :edit }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user = @adventure.user

    @adventure.maps.each do |map|
      map.destroy
    end

    @adventure.destroy
    respond_to do |format|
      format.html { redirect_to user_path(user.id), notice: 'Adventure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_adventure
      @adventure = Adventure.find(params[:id])
    end

    def adventure_params
      params.require(:adventure).permit(:title, :story, :user_id, :characters)
    end
end
