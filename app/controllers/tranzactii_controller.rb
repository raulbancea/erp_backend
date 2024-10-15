class TranzactiiController < ApplicationController
  include Rails.application.routes.url_helpers

  def index
    @tranzactii = Transaction.all

    tranzactii_with_urls = @tranzactii.map do |tranzactie|
      tranzactie_hash = tranzactie.as_json
      tranzactie_hash[:file_url] = tranzactie.file.attached? ? url_for(tranzactie.file) : nil
      tranzactie_hash
    end

    render json: tranzactii_with_urls
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
    params.require(:transaction).permit(:product_name, :quantity, :date)
  end
end
