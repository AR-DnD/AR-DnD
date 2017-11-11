class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy, :jsondata]

  def index
    @maps = Map.all
  end

  def show
  end

  def new
    @map = Map.new
  end

  def edit
  end

  def create
    params = map_params
    params[:adventure] = Adventure.find(params[:adventure].to_i)
    @map = Map.new(params)
    puts "Map: #{@map.inspect}"
    respond_to do |format|
      if @map.save
        format.html { redirect_to edit_adventure_path(params[:adventure_id]), notice: 'Map was successfully created.' }
        format.json { render :show, status: :created, location: adventure_path(@map.adventure) }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to edit_adventure_path(params[:adventure_id]), notice: 'Map was successfully updated.' }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    adventure = @map.adventure
    @map.destroy

    respond_to do |format|
      format.html { redirect_to edit_adventure_path(adventure.id), notice: 'Map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def jsondata
      render :layout => false
    end

  private

    def set_map
      @map = Map.find(params[:id])
    end

    def map_params
      params.require(:map).permit(:name, :data, :story, :adventure_id, :size)
    end



end
