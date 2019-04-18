class ListOfMapsController < ApplicationController
  before_action :set_list_of_map, only: [:show, :edit, :update, :destroy]

  # GET /list_of_maps
  # GET /list_of_maps.json
  def index
    @list_of_maps = ListOfMap.all
  end

  # GET /list_of_maps/1
  # GET /list_of_maps/1.json
  def show
  end

  # GET /list_of_maps/new
  def new
    @list_of_map = ListOfMap.new
  end

  # GET /list_of_maps/1/edit
  def edit
  end

  # POST /list_of_maps
  # POST /list_of_maps.json
  def create
    @list_of_map = ListOfMap.new(list_of_map_params)

    respond_to do |format|
      if @list_of_map.save
        format.html { redirect_to @list_of_map, notice: 'List of map was successfully created.' }
        format.json { render :show, status: :created, location: @list_of_map }
      else
        format.html { render :new }
        format.json { render json: @list_of_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_of_maps/1
  # PATCH/PUT /list_of_maps/1.json
  def update
    respond_to do |format|
      if @list_of_map.update(list_of_map_params)
        format.html { redirect_to @list_of_map, notice: 'List of map was successfully updated.' }
        format.json { render :show, status: :ok, location: @list_of_map }
      else
        format.html { render :edit }
        format.json { render json: @list_of_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_of_maps/1
  # DELETE /list_of_maps/1.json
  def destroy
    @list_of_map.destroy
    respond_to do |format|
      format.html { redirect_to list_of_maps_url, notice: 'List of map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_of_map
      @list_of_map = ListOfMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_of_map_params
      params.require(:list_of_map).permit(:user_id, :map_id, :rock_glacier)
    end
end
