
class ReferenceLinksController < ApplicationController
  # GET /reference_links
  # GET /reference_links.json
  def index
    @reference_links = ReferenceLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reference_links }
    end
  end
end
