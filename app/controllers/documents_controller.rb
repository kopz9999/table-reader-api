class DocumentsController < ApplicationController
  def create
    document = Document.process_payload params
    render json: document, only: :id
  end
  def download

  end
end
