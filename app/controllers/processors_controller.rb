class ProcessorsController < ApplicationController
  before_action :set_processor, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?
  # GET /processors
  # GET /processors.json
  def index
    @processors = Processor.all
  end

  # GET /processors/1
  # GET /processors/1.json
  def show
  end

  # GET /processors/new
  def new
    @processor = Processor.new
  end

  # GET /processors/1/edit
  def edit
  end

  # POST /processors
  # POST /processors.json
  def create
    @processor = Processor.new(processor_params)

    respond_to do |format|
      if @processor.save
        format.html { redirect_to @processor, notice: 'Processor was successfully created.' }
        format.json { render :show, status: :created, location: @processor }
      else
        format.html { render :new }
        format.json { render json: @processor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processors/1
  # PATCH/PUT /processors/1.json
  def update
    respond_to do |format|
      if @processor.update(processor_params)
        format.html { redirect_to @processor, notice: 'Processor was successfully updated.' }
        format.json { render :show, status: :ok, location: @processor }
      else
        format.html { render :edit }
        format.json { render json: @processor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processors/1
  # DELETE /processors/1.json
  def destroy
    @processor.destroy
    respond_to do |format|
      format.html { redirect_to processors_url, notice: 'Processor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_by_spread
  end

  def create_by_spread
    if processor_params[:spreadsheet].empty?
      redirect_to power_supplies_path, notice: 'Invalid input.'
      return
    end
    entries = processor_params[:spreadsheet].split(/\n/)
    entries.each do |row|
      row.gsub!(',','.')
      cpu = Processor.new
      entry = row.split(/[\t;]/)
      cpu.name = entry[0]
      cpu.single = entry[1]
      cpu.multi = entry[2]
      cpu.OC = entry[7]
      cpu.power = entry[9]
      cpu.link = entry[8]
      if Graphic.exists?(:name => entry[6])
        cpu.iGPU = Graphic.find_by name: entry[6]
      end
      if Platform.exists?(:name => entry[5])
        cpu.platform = Platform.find_by name: entry[5]
      else
        p = Platform.new
        p.name = entry[5]
        p.save
        cpu.platform = p
      end
      cpu.picture = entry[10]
      cpu.save
    end
    redirect_to processors_path, notice: 'Records saved.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor
      @processor = Processor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processor_params
      params.require(:processor).permit(:name, :single, :multi, :average, :platform_id, :iGPU, :OC, :link, :power, :dollar_price, :euro_price, :picture, :spreadsheet)
    end
end
