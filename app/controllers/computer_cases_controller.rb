class ComputerCasesController < ApplicationController
  before_action :set_computer_case, only: [:show, :edit, :update, :destroy]

  # GET /computer_cases
  # GET /computer_cases.json
  def index
    @computer_cases = ComputerCase.all
  end

  # GET /computer_cases/1
  # GET /computer_cases/1.json
  def show
  end

  # GET /computer_cases/new
  def new
    @computer_case = ComputerCase.new
  end

  # GET /computer_cases/1/edit
  def edit
  end

  # POST /computer_cases
  # POST /computer_cases.json
  def create
    @computer_case = ComputerCase.new(computer_case_params)

    respond_to do |format|
      if @computer_case.save
        format.html { redirect_to @computer_case, notice: 'Computer case was successfully created.' }
        format.json { render :show, status: :created, location: @computer_case }
      else
        format.html { render :new }
        format.json { render json: @computer_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computer_cases/1
  # PATCH/PUT /computer_cases/1.json
  def update
    respond_to do |format|
      if @computer_case.update(computer_case_params)
        format.html { redirect_to @computer_case, notice: 'Computer case was successfully updated.' }
        format.json { render :show, status: :ok, location: @computer_case }
      else
        format.html { render :edit }
        format.json { render json: @computer_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computer_cases/1
  # DELETE /computer_cases/1.json
  def destroy
    @computer_case.destroy
    respond_to do |format|
      format.html { redirect_to computer_cases_url, notice: 'Computer case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer_case
      @computer_case = ComputerCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_case_params
      params.require(:computer_case).permit(:name, :link, :dollar_price, :euro_price, :size, :performance)
    end
end
