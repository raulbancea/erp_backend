class InventarController < ApplicationController

  def index
    @inventar = Inventar.all
    render json: @inventar
  end

  def create
    @inventar = Inventar.new(inventar_params)
    if @inventar.save
      render json: @inventar, status: :created
    else
      render json: @inventar.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @inventar = Inventar.find(params[:id])
    @inventar.destroy
    head :no_content
  end

  private

  def inventar_params
    params.require(:inventar).permit(:name, :description, :quantity)
  end
end
