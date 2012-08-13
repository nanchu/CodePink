
class DronesController < ApplicationController
  # GET /drones
  # GET /drones.json
  def index
    @drones = Drone.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drones }
    end
  end

  # GET /drones/1
  # GET /drones/1.json
  def show
    @drone = Drone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drone }
    end
  end

  # GET /drones/new
  # GET /drones/new.json
  def new
    @drone = Drone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drone }
    end
  end

  # GET /drones/1/edit
  def edit
    @drone = Drone.find(params[:id])
  end

  # POST /drones
  # POST /drones.json
  def create
    @drone = Drone.new(params[:drone])

    respond_to do |format|
      if @drone.save
        format.html { redirect_to @drone, notice: 'Drone was successfully created.' }
        format.json { render json: @drone, status: :created, location: @drone }
      else
        format.html { render action: "new" }
        format.json { render json: @drone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drones/1
  # PUT /drones/1.json
  def update
    @drone = Drone.find(params[:id])

    respond_to do |format|
      if @drone.update_attributes(params[:drone])
        format.html { redirect_to @drone, notice: 'Drone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drones/1
  # DELETE /drones/1.json
  def destroy
    @drone = Drone.find(params[:id])
    @drone.destroy

    respond_to do |format|
      format.html { redirect_to drones_url }
      format.json { head :no_content }
    end
  end
end
