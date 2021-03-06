class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy, :jsondata]

  def index
    @maps = Map.where('adventure_id = ?', params[:adventure_id])
  end

  def show
  end

  def new
    @map = Map.new
    @adventure = Adventure.find(params[:adventure_id])
  end

  def edit
  end

  def create
    @map = Map.new(map_params)
    respond_to do |format|
      if @map.save
        format.html { redirect_to edit_user_adventure_path(id: params[:adventure_id], user_id: current_user.id), notice: 'Map was successfully created.' }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to edit_user_adventure_path(id: params[:adventure_id], user_id: current_user.id), notice: 'Map was successfully updated.' }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @adventure = @map.adventure
    @map.destroy

    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end

    def jsondata
      render :layout => false
    end

  private

    def set_map
      @map = Map.find(params[:id])
      @adventure = Adventure.find(params[:adventure_id])
    end

    def map_params
      params.require(:map).permit(:name, :data, :story, :adventure_id, :size)
    end
end
