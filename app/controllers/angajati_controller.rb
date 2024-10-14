class AngajatiController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :handle_missing_params

  def index
    @angajati = Angajat.all
    render json: @angajati
  end

  def create
    @angajat = Angajat.new(angajat_params)

    if @angajat.save
      render json: @angajat, status: :created
    else
      render json: @angajat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @angajat = Angajat.find(params[:id])
    @angajat.destroy
    head :no_content
  end

  private

  def angajat_params
    params.require(:angajati).permit(:name, :position, :department)
  end


  def handle_missing_params(exception)
    render json: { error: exception.message }, status: :bad_request
  end
end
