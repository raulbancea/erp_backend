class TranzactiiController < ApplicationController
  def index
    @tranzactii = Transaction.all
    render json: @tranzactii
  end

  def create
    @tranzactie = Transaction.new(tranzactie_params)

    if @tranzactie.save
      render json: @tranzactie, status: :created
    else
      render json: @tranzactie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tranzactie = Transaction.find(params[:id])

    @tranzactie.destroy

    head :no_content
  end

  private

  def tranzactie_params
    params.require(:transaction).permit(:product_name, :quantity, :date, :transaction_type)
  end
end
