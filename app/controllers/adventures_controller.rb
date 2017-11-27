class AdventuresController < ApplicationController
  before_action :set_adventure, only: [:show, :edit, :update, :destroy, :copy]

  def copy
    @copy = @adventure.make_copy current_user
    current_user.adventures << @copy
    @copy.copy_adventures @adventure
    redirect_to edit_user_adventure_path(@copy, user_id: @adventure.user.id), notice: 'Adventure was successfully saved.'
  end

  def index
    # @adventures = Adventure.all
    @adventures = current_user.adventures
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
    params[:characters].each do |character_id|
      @adventure.characters << Character.find(character_id.to_i)
    end
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
    @adventure.characters = []
    params[:characters].each do |character_id|
      @adventure.characters << Character.find(character_id.to_i)
    end
    respond_to do |format|
      if @adventure.update(adventure_params)
        format.html { redirect_to user_adventure_path(id: @adventure.id, user_id: @adventure.user.id), notice: 'Adventure was successfully updated.' }
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
