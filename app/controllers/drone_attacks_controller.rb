class DroneAttacksController < ApplicationController
  layout 'blank'

  def index
    @drone_attacks = DroneAttack.all
  end

  def show
    @drone_attack = DroneAttack.find(params[:id])
  end
end
