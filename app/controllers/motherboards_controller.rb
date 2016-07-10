class MotherboardsController < ApplicationController
  before_action :set_motherboard, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?
  # GET /motherboards
  # GET /motherboards.json
  def index
    @motherboards = Motherboard.all
  end

  # GET /motherboards/1
  # GET /motherboards/1.json
  def show
  end

  # GET /motherboards/new
  def new
    @motherboard = Motherboard.new
  end

  # GET /motherboards/1/edit
  def edit
  end

  # POST /motherboards
  # POST /motherboards.json
  def create
    @motherboard = Motherboard.new(motherboard_params)

    respond_to do |format|
      if @motherboard.save
        format.html { redirect_to @motherboard, notice: 'Motherboard was successfully created.' }
        format.json { render :show, status: :created, location: @motherboard }
      else
        format.html { render :new }
        format.json { render json: @motherboard.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_by_spread
  end
  def multiple_new_by_spread
  end
  def multiple_create_by_spread
    if motherboard_params[:spreadsheet].empty?
      redirect_to motherboards_path, notice: 'Invalid input.'
      return
    end
    entries = motherboard_params[:spreadsheet].split(/\n/)
    entries.each do |row|
      motherboard = Motherboard.new
      entry = row.split(/[\t;]/)
      motherboard.name = entry[0]
      motherboard.size = entry[1]
      motherboard.ram_slots = entry[2].to_i
      motherboard.memory = entry[3].to_i
      motherboard.link = entry[4]
      platform = Platform.find_by name: entry[5]
      motherboard.platform = platform
      motherboard.dollar_price = entry[6].to_f
      motherboard.OC = entry[7].to_f
      motherboard.score = entry[8].to_f
      motherboard.save
    end
    redirect_to motherboards_path, notice: 'Motherboards were successfully created.'
  end

  def create_by_spread
    motherboard = Motherboard.new
    if motherboard_params[:spreadsheet].empty?
      redirect_to motherboards_path, notice: 'Invalid input.'
      return
    end

      entry = motherboard_params[:spreadsheet].split(';')

      motherboard.name = entry[0]
      motherboard.size = entry[1]
      motherboard.ram_slots = entry[2].to_i
      motherboard.memory = entry[3].to_i
      motherboard.link = entry[4]
      platform = Platform.find_by name: entry[5]
      motherboard.platform = platform
      motherboard.dollar_price = entry[6].to_f
      motherboard.OC = entry[7].to_f
      motherboard.score = entry[8].to_f
      motherboard.save
      redirect_to motherboards_path, notice: 'Motherboard was successfully created.'
      return

  end

  # PATCH/PUT /motherboards/1
  # PATCH/PUT /motherboards/1.json
  def update
    respond_to do |format|
      if @motherboard.update(motherboard_params)
        format.html { redirect_to @motherboard, notice: 'Motherboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @motherboard }
      else
        format.html { render :edit }
        format.json { render json: @motherboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motherboards/1
  # DELETE /motherboards/1.json
  def destroy
    @motherboard.destroy
    respond_to do |format|
      format.html { redirect_to motherboards_url, notice: 'Motherboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motherboard
      @motherboard = Motherboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motherboard_params
      params.require(:motherboard).permit(:name, :platform_id, :memory, :link, :size, :OC, :ram_slots, :dollar_price, :euro_price, :score, :spreadsheet, :picture)
    end
end
