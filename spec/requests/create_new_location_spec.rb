require 'spec_helper'

describe "Location Pages" do

  before { LocationGroup.create(name: "ExampleLocationGroup", xcoordinate: 400, ycoordinate: 400)}

  describe "create new location" do
    let(:user) { FactoryGirl.create(:user)}
    before do
      sign_in user
    end
    it"should be able to create new location via 'locations/new'" do
      visit '/locations/new'

      page.should have_content('Create A New Location')

      fill_in "City", with: "ExampleCity"
      fill_in "Province", with: "ExampleProvince"
      fill_in "Information", with: "ExampleInformation"

      click_button "Create Location"

      page.should have_content('Location was successfully created.')
      page.should have_selector('title', text: "Code Pink")

      location = Location.where(:city => "ExampleCity").first

      location.should_not be_nil
      location.city.should == "ExampleCity"
      location.province.should == "ExampleProvince"
      location.information.should == "ExampleInformation"
      location.location_group.xcoordinate.should == 400
      location.location_group.ycoordinate.should == 400
    end
  end
end
