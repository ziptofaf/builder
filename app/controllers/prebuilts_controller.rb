class PrebuiltsController < ApplicationController
  before_action :set_prebuilt, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?
  # GET /prebuilts
  # GET /prebuilts.json
  def index
    @prebuilts = Prebuilt.all
  end

  # GET /prebuilts/1
  # GET /prebuilts/1.json
  def show
  end

  # GET /prebuilts/new
  def new
    @prebuilt = Prebuilt.new
  end

  # GET /prebuilts/1/edit
  def edit
  end

  # POST /prebuilts
  # POST /prebuilts.json
  def create
    @prebuilt = Prebuilt.new(prebuilt_params)

    respond_to do |format|
      if @prebuilt.save
        format.html { redirect_to @prebuilt, notice: 'Prebuilt was successfully created.' }
        format.json { render :show, status: :created, location: @prebuilt }
      else
        format.html { render :new }
        format.json { render json: @prebuilt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prebuilts/1
  # PATCH/PUT /prebuilts/1.json
  def update
    respond_to do |format|
      if @prebuilt.update(prebuilt_params)
        format.html { redirect_to @prebuilt, notice: 'Prebuilt was successfully updated.' }
        format.json { render :show, status: :ok, location: @prebuilt }
      else
        format.html { render :edit }
        format.json { render json: @prebuilt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prebuilts/1
  # DELETE /prebuilts/1.json
  def destroy
    @prebuilt.destroy
    respond_to do |format|
      format.html { redirect_to prebuilts_url, notice: 'Prebuilt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prebuilt
      @prebuilt = Prebuilt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prebuilt_params
      params.require(:prebuilt).permit(:price, :processor_id, :graphic_id, :memory_id, :drive_id, :motherboard_id, :computer_case_id, :power_supply_id, :performance, :type_build, :real_price)
    end
end
