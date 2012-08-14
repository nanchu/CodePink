require 'test_helper'

class DroneAttacksControllerTest < ActionController::TestCase
  setup do
    @drone_attack = drone_attacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drone_attacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drone_attack" do
    assert_difference('DroneAttack.count') do
      post :create, :drone_attack => { :al_qaida_max => @drone_attack.al_qaida_max, :al_qaida_min => @drone_attack.al_qaida_min, :city => @drone_attack.city, :civilians_max => @drone_attack.civilians_max, :civilians_min => @drone_attack.civilians_min, :display_date => @drone_attack.display_date, :forigeners_max => @drone_attack.forigeners_max, :forigeners_min => @drone_attack.forigeners_min, :incident_date => @drone_attack.incident_date, :incident_year => @drone_attack.incident_year, :injured_max => @drone_attack.injured_max, :injured_min => @drone_attack.injured_min, :location => @drone_attack.location, :province => @drone_attack.province, :taliban_max => @drone_attack.taliban_max, :taliban_min => @drone_attack.taliban_min, :total_died_max => @drone_attack.total_died_max, :total_died_min => @drone_attack.total_died_min, :url => @drone_attack.url, :women => @drone_attack.women }
    end

    assert_redirected_to drone_attack_path(assigns(:drone_attack))
  end

  test "should show drone_attack" do
    get :show, :id => @drone_attack
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @drone_attack
    assert_response :success
  end

  test "should update drone_attack" do
    put :update, :id => @drone_attack, :drone_attack => { :al_qaida_max => @drone_attack.al_qaida_max, :al_qaida_min => @drone_attack.al_qaida_min, :city => @drone_attack.city, :civilians_max => @drone_attack.civilians_max, :civilians_min => @drone_attack.civilians_min, :display_date => @drone_attack.display_date, :forigeners_max => @drone_attack.forigeners_max, :forigeners_min => @drone_attack.forigeners_min, :incident_date => @drone_attack.incident_date, :incident_year => @drone_attack.incident_year, :injured_max => @drone_attack.injured_max, :injured_min => @drone_attack.injured_min, :location => @drone_attack.location, :province => @drone_attack.province, :taliban_max => @drone_attack.taliban_max, :taliban_min => @drone_attack.taliban_min, :total_died_max => @drone_attack.total_died_max, :total_died_min => @drone_attack.total_died_min, :url => @drone_attack.url, :women => @drone_attack.women }
    assert_redirected_to drone_attack_path(assigns(:drone_attack))
  end

  test "should destroy drone_attack" do
    assert_difference('DroneAttack.count', -1) do
      delete :destroy, :id => @drone_attack
    end

    assert_redirected_to drone_attacks_path
  end
end
