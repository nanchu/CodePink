require 'spec_helper'

describe "drone_attacks/index" do
  before(:each) do
    assign(:drone_attacks, [
      stub_model(DroneAttack,
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
      ),
      stub_model(DroneAttack,
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
      )
    ])
  end

  it "renders a list of drone_attacks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Province".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
