class MakerController < ApplicationController
  include MakerHelper
  include PdfHelper
  skip_before_action :authenticate_user!
  def build
  end

  def make
    redirect_to maker_build_path and flash[:error]="Invalid input data. That's weird, please try again in a moment." and return unless check_validity
    begin
    @build = buildAPC(maker_params[:budget].to_i, maker_params[:currency].to_i, maker_params[:build_size].to_i, maker_params[:build_type].to_i)
    @currency = maker_params[:currency].to_i
    rescue  ServerNotOnlineError
      redirect_to maker_build_path and flash[:error]="Seems that we have some issues on our end. Please try again in a moment" and return
    rescue BudgetingIssueOrConnectionError
      redirect_to maker_build_path and flash[:error]="Something went wrong. Maybe budget you entered was too low? Try again in a moment" and return
    end
    respond_to do |format|
      format.html do
        render 'result'
      end
      format.pdf do
        pdf = ReportPdf.new(@build, @currency)
        send_data pdf.render, filename: 'build.pdf', type: 'application/pdf'
      end
    end
  end
  def maker_params
    params.require(:maker).permit(:build_type, :build_size, :currency, :budget)
  end

  private

  def check_validity
    return false if !maker_params[:build_type] or !maker_params[:build_size] or !maker_params[:currency] or !maker_params[:budget]
    return false if maker_params[:currency].to_i > 2 or maker_params[:currency].to_i < 1
    return false if maker_params[:build_size].to_i > 3 or maker_params[:build_size].to_i < 1
    return false if maker_params[:budget].to_i > 3000 or maker_params[:budget].to_i < 200
    return true

  end
end
