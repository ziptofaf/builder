class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?
  # GET /memories
  # GET /memories.json
  def index
    @memories = Memory.all
  end

  # GET /memories/1
  # GET /memories/1.json
  def show
  end

  # GET /memories/new
  def new
    @memory = Memory.new
  end

  # GET /memories/1/edit
  def edit
  end

  # POST /memories
  # POST /memories.json
  def create
    @memory = Memory.new(memory_params)

    respond_to do |format|
      if @memory.save
        format.html { redirect_to @memory, notice: 'Memory was successfully created.' }
        format.json { render :show, status: :created, location: @memory }
      else
        format.html { render :new }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memories/1
  # PATCH/PUT /memories/1.json
  def update
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to @memory, notice: 'Memory was successfully updated.' }
        format.json { render :show, status: :ok, location: @memory }
      else
        format.html { render :edit }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memories/1
  # DELETE /memories/1.json
  def destroy
    @memory.destroy
    respond_to do |format|
      format.html { redirect_to memories_url, notice: 'Memory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def new_by_spread
    end

    def create_by_spread
      if memory_params[:spreadsheet].empty?
        redirect_to memories_path, notice: 'Invalid input.'
        return
      end
      entries = memory_params[:spreadsheet].split(/\n/)
      entries.each do |row|
        mem = Memory.new
        entry = row.split(/[\t;]/)
        mem.name = entry[0]
        mem.ram_type = entry[1]
        mem.link = entry[2]
        mem.sticks = entry[5]
        mem.capacity = entry[6]
        mem.score = entry[7]
        mem.save
      end

      redirect_to  memories_path, notice: 'Records saved.'
      return
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memory
      @memory = Memory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memory_params
      params.require(:memory).permit(:ram_type, :name, :link, :dollar_price, :euro_price, :sticks, :capacity, :score, :spreadsheet, :picture)
    end
end
