class PowerSuppliesController < ApplicationController
  before_action :set_power_supply, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?
  # GET /power_supplies
  # GET /power_supplies.json
  def index
    @power_supplies = PowerSupply.all
  end

  # GET /power_supplies/1
  # GET /power_supplies/1.json
  def show
  end

  # GET /power_supplies/new
  def new
    @power_supply = PowerSupply.new
  end

  # GET /power_supplies/1/edit
  def edit
  end

  # POST /power_supplies
  # POST /power_supplies.json
  def create
    @power_supply = PowerSupply.new(power_supply_params)

    respond_to do |format|
      if @power_supply.save
        format.html { redirect_to @power_supply, notice: 'Power supply was successfully created.' }
        format.json { render :show, status: :created, location: @power_supply }
      else
        format.html { render :new }
        format.json { render json: @power_supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /power_supplies/1
  # PATCH/PUT /power_supplies/1.json
  def update
    respond_to do |format|
      if @power_supply.update(power_supply_params)
        format.html { redirect_to @power_supply, notice: 'Power supply was successfully updated.' }
        format.json { render :show, status: :ok, location: @power_supply }
      else
        format.html { render :edit }
        format.json { render json: @power_supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /power_supplies/1
  # DELETE /power_supplies/1.json
  def destroy
    @power_supply.destroy
    respond_to do |format|
      format.html { redirect_to power_supplies_url, notice: 'Power supply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_by_spread
  end

  def create_by_spread
    if power_supply_params[:spreadsheet].empty?
      redirect_to power_supplies_path, notice: 'Invalid input.'
      return
    end
    entries = power_supply_params[:spreadsheet].split(/\n/)
    entries.each do |row|
      psu = PowerSupply.new
      entry = row.split(';')
      psu.name = entry[0]
      psu.performance = entry[3]
      psu.power = entry[2]
      psu.link = entry[1]
      psu.save
    end

    redirect_to power_supplies_path, notice: 'Records saved.'
    return
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power_supply
      @power_supply = PowerSupply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def power_supply_params
      params.require(:power_supply).permit(:name, :link, :dollar_price, :euro_price, :power, :performance, :spreadsheet, :picture)
    end
end
