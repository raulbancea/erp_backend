class DocumenteController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :handle_missing_params

  def index
    @documents = Document.all
    render json: @documents.map { |doc| document_to_json(doc) }
  end

  def create
    @document = Document.new(document_params)

    if params[:document][:file]
      @document.file.attach(params[:document][:file])
    end

    if @document.save
      render json: document_to_json(@document), status: :created
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    head :no_content
  end

  def show
    @document = Document.find(params[:id])
    if @document.file.attached?
      redirect_to rails_blob_path(@document.file, disposition: "attachment")
    else
      render json: { error: "File not found" }, status: :not_found
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :description)
  end

  def document_to_json(document)
    {
      id: document.id,
      title: document.title,
      description: document.description,
      filename: document.file.attached? ? document.file.filename.to_s : nil,
      preview_url: document.file.attached? ? rails_blob_path(document.file) : nil
    }
  end
end
