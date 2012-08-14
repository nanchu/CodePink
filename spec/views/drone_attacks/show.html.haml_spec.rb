require 'spec_helper'

describe "drone_attacks/show" do
  before(:each) do
    @drone_attack = assign(:drone_attack, stub_model(DroneAttack,
      :incident_year => 1,
      :location => "Location",
      :province => "Province",
      :city => "City",
      :al_qaida_min => 2,
      :al_qaida_max => 3,
      :taliban_min => 4,
      :taliban_max => 5,
      :civilians_min => 6,
      :civilians_max => 7,
      :forigeners_min => 8,
      :forigeners_max => 9,
      :total_died_min => 10,
      :total_died_max => 11,
      :injured_min => 12,
      :injured_max => 13,
      :women => false,
      :url => "Url",
      :display_date => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Location/)
    rendered.should match(/Province/)
    rendered.should match(/City/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/11/)
    rendered.should match(/12/)
    rendered.should match(/13/)
    rendered.should match(/false/)
    rendered.should match(/Url/)
    rendered.should match(//)
  end
end
