class DrivesController < ApplicationController
  before_action :set_drive, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?

  # GET /drives
  # GET /drives.json
  def index
    @drives = Drive.all
  end

  # GET /drives/1
  # GET /drives/1.json
  def show
  end

  # GET /drives/new
  def new
    @drive = Drive.new
  end

  # GET /drives/1/edit
  def edit
  end

  # POST /drives
  # POST /drives.json
  def create
    @drive = Drive.new(drive_params)

    respond_to do |format|
      if @drive.save
        format.html { redirect_to @drive, notice: 'Drive was successfully created.' }
        format.json { render :show, status: :created, location: @drive }
      else
        format.html { render :new }
        format.json { render json: @drive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drives/1
  # PATCH/PUT /drives/1.json
  def update
    respond_to do |format|
      if @drive.update(drive_params)
        format.html { redirect_to @drive, notice: 'Drive was successfully updated.' }
        format.json { render :show, status: :ok, location: @drive }
      else
        format.html { render :edit }
        format.json { render json: @drive.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_by_spread
  end

  def create_by_spread
    if drive_params[:spreadsheet].empty?
      redirect_to drives_path, notice: 'Invalid input.'
      return
    end
    entries = drive_params[:spreadsheet].split(/\n/)
    entries.each do |row|
      drive = Drive.new
      entry = row.split(';')
      drive.name = entry[0]
      drive.capacity = entry[1]
      drive.disk_type = entry[2]
      drive.performance = entry[3]
      drive.link = entry[6]
      drive.save
    end
    redirect_to drives_path, notice: 'Records saved.'

  end


  # DELETE /drives/1
  # DELETE /drives/1.json
  def destroy
    @drive.destroy
    respond_to do |format|
      format.html { redirect_to drives_url, notice: 'Drive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drive
      @drive = Drive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drive_params
      params.require(:drive).permit(:name, :link, :dollar_price, :euro_price, :capacity, :performance, :disk_type, :spreadsheet)
    end
end
