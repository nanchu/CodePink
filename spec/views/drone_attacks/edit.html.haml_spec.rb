require 'spec_helper'

describe "drone_attacks/edit" do
  before(:each) do
    @drone_attack = assign(:drone_attack, stub_model(DroneAttack,
      :incident_year => 1,
      :location => "MyString",
      :province => "MyString",
      :city => "MyString",
      :al_qaida_min => 1,
      :al_qaida_max => 1,
      :taliban_min => 1,
      :taliban_max => 1,
      :civilians_min => 1,
      :civilians_max => 1,
      :forigeners_min => 1,
      :forigeners_max => 1,
      :total_died_min => 1,
      :total_died_max => 1,
      :injured_min => 1,
      :injured_max => 1,
      :women => false,
      :url => "MyString",
      :display_date => ""
    ))
  end

  it "renders the edit drone_attack form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => drone_attacks_path(@drone_attack), :method => "post" do
      assert_select "input#drone_attack_incident_year", :name => "drone_attack[incident_year]"
      assert_select "input#drone_attack_location", :name => "drone_attack[location]"
      assert_select "input#drone_attack_province", :name => "drone_attack[province]"
      assert_select "input#drone_attack_city", :name => "drone_attack[city]"
      assert_select "input#drone_attack_al_qaida_min", :name => "drone_attack[al_qaida_min]"
      assert_select "input#drone_attack_al_qaida_max", :name => "drone_attack[al_qaida_max]"
      assert_select "input#drone_attack_taliban_min", :name => "drone_attack[taliban_min]"
      assert_select "input#drone_attack_taliban_max", :name => "drone_attack[taliban_max]"
      assert_select "input#drone_attack_civilians_min", :name => "drone_attack[civilians_min]"
      assert_select "input#drone_attack_civilians_max", :name => "drone_attack[civilians_max]"
      assert_select "input#drone_attack_forigeners_min", :name => "drone_attack[forigeners_min]"
      assert_select "input#drone_attack_forigeners_max", :name => "drone_attack[forigeners_max]"
      assert_select "input#drone_attack_total_died_min", :name => "drone_attack[total_died_min]"
      assert_select "input#drone_attack_total_died_max", :name => "drone_attack[total_died_max]"
      assert_select "input#drone_attack_injured_min", :name => "drone_attack[injured_min]"
      assert_select "input#drone_attack_injured_max", :name => "drone_attack[injured_max]"
      assert_select "input#drone_attack_women", :name => "drone_attack[women]"
      assert_select "input#drone_attack_url", :name => "drone_attack[url]"
      assert_select "input#drone_attack_display_date", :name => "drone_attack[display_date]"
    end
  end
end
