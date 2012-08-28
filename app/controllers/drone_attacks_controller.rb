
class DroneAttacksController < ApplicationController
  #respond_to :json { render :layout => 'blank'}
  # GET /drone_attacks
  # GET /drone_attacks.json
  def index
    @drone_attacks = DroneAttack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :layout => 'blank'}
    end
  end

  # GET /drone_attacks/1
  # GET /drone_attacks/1.json
  def show
    @drone_attack = DroneAttack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :layout => 'blank' }
    end
  end

  # GET /drone_attacks/new
  # GET /drone_attacks/new.json
  def new
    @drone_attack = DroneAttack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drone_attack }
    end
  end

  # GET /drone_attacks/1/edit
  def edit
    @drone_attack = DroneAttack.find(params[:id])
  end

  # POST /drone_attacks
  # POST /drone_attacks.json
  def create
    @drone_attack = DroneAttack.new(params[:drone_attack])

    respond_to do |format|
      if @drone_attack.save
        format.html { redirect_to @drone_attack, notice: 'Drone attack was successfully created.' }
        format.json { render json: @drone_attack, status: :created, location: @drone_attack }
      else
        format.html { render action: "new" }
        format.json { render json: @drone_attack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drone_attacks/1
  # PUT /drone_attacks/1.json
  def update
    @drone_attack = DroneAttack.find(params[:id])

    respond_to do |format|
      if @drone_attack.update_attributes(params[:drone_attack])
        format.html { redirect_to @drone_attack, notice: 'Drone attack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drone_attack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drone_attacks/1
  # DELETE /drone_attacks/1.json
  def destroy
    @drone_attack = DroneAttack.find(params[:id])
    @drone_attack.destroy

    respond_to do |format|
      format.html { redirect_to drone_attacks_url }
      format.json { head :no_content }
    end
  end
end