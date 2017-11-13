class AdventuresController < ApplicationController
  before_action :set_adventure, only: [:show, :edit, :update, :destroy]

  def index
    @adventures = Adventure.all
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
    @adventure.user = current_user
    if @adventure.save
      redirect_to edit_adventure_path(@adventure), notice: 'Adventure was successfully created.'
    else
      respond_to do |format|
        if @adventure.save
          format.html { redirect_to edit_adventure_path(@adventure), notice: 'Adventure was successfully created.' }
          format.json { render :show, status: :created, location: @adventure }
        else
          format.html { render :new }
          format.json { render json: @adventure.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @adventure.update(adventure_params)
        format.html { redirect_to @adventure, notice: 'Adventure was successfully updated.' }
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
      format.html { redirect_to user_url(user), notice: 'Adventure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_adventure
      @adventure = Adventure.find(params[:id])
    end

    def adventure_params
      params.require(:adventure).permit(:title, :story, :user_id)
    end
end
