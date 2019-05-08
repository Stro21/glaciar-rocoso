class MaplistsController < ApplicationController
  before_action :set_maplist, only: [:show, :edit, :update, :destroy]

  # GET /maplists
  # GET /maplists.json
  def index
    @maplists = Maplist.all
  end

  # GET /maplists/1
  # GET /maplists/1.json
  def show
  end

  # GET /maplists/new
  def new
    @maplist = Maplist.new
  end

  # GET /maplists/1/edit
  def edit
  end

  # POST /maplists
  # POST /maplists.json
  def create
    @maplist = Maplist.new(maplist_params)

    respond_to do |format|
      if @maplist.save
        format.html { redirect_to @maplist, notice: 'Maplist was successfully created.' }
        format.json { render :show, status: :created, location: @maplist }
      else
        format.html { render :new }
        format.json { render json: @maplist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maplists/1
  # PATCH/PUT /maplists/1.json
  def update
    respond_to do |format|
      if @maplist.update(maplist_params)
        format.html { redirect_to @maplist, notice: 'Maplist was successfully updated.' }
        format.json { render :show, status: :ok, location: @maplist }
      else
        format.html { render :edit }
        format.json { render json: @maplist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maplists/1
  # DELETE /maplists/1.json
  def destroy
    @maplist.destroy
    respond_to do |format|
      format.html { redirect_to maplists_url, notice: 'Maplist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maplist
      @maplist = Maplist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maplist_params
      params.require(:maplist).permit(:user_id, :map_id, :glaciar_rock)
    end
end
