
class PublishersController < ApplicationController
  # GET /publishers
  # GET /publishers.json
  def index
    @publishers = Publisher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publishers }
    end
  end
end
