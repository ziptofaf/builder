class GraphicsController < ApplicationController
  before_action :set_graphic, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?
  # GET /graphics
  # GET /graphics.json
  def index
    @graphics = Graphic.all
  end

  # GET /graphics/1
  # GET /graphics/1.json
  def show
  end

  # GET /graphics/new
  def new
    @graphic = Graphic.new
  end

  # GET /graphics/1/edit
  def edit
  end

  # POST /graphics
  # POST /graphics.json
  def create
    @graphic = Graphic.new(graphic_params)

    respond_to do |format|
      if @graphic.save
        format.html { redirect_to @graphic, notice: 'Graphic was successfully created.' }
        format.json { render :show, status: :created, location: @graphic }
      else
        format.html { render :new }
        format.json { render json: @graphic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graphics/1
  # PATCH/PUT /graphics/1.json
  def update
    respond_to do |format|
      if @graphic.update(graphic_params)
        format.html { redirect_to @graphic, notice: 'Graphic was successfully updated.' }
        format.json { render :show, status: :ok, location: @graphic }
      else
        format.html { render :edit }
        format.json { render json: @graphic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graphics/1
  # DELETE /graphics/1.json
  def destroy
    @graphic.destroy
    respond_to do |format|
      format.html { redirect_to graphics_url, notice: 'Graphic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_by_spread
  end
  def create_by_spread
    if graphic_params[:spreadsheet].empty?
      redirect_to graphics_path, notice: 'Invalid input.'
      return
    end
    entries = graphic_params[:spreadsheet].split(/\n/)

    entries.each do |row|
      row.gsub!(',','.')
      gpu = Graphic.new
      entry = row.split(/[\t;]/)
      gpu.name = entry[0]
      gpu.power = entry[1]
      gpu.performance = entry[2]
      gpu.link = entry[5]
      gpu.size = entry[6]
      gpu.cpu_average = entry[7]
      gpu.save
    end

    redirect_to graphics_path, notice: 'Records saved.'
    return
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graphic
      @graphic = Graphic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graphic_params
      params.require(:graphic).permit(:name, :link, :size, :dollar_price, :euro_price, :cpu_average, :performance, :power, :spreadsheet, :picture)
    end
end
