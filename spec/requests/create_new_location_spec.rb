require 'spec_helper'

describe "Creating New Location" do

  it"should be able to create new location via 'locations/new'" do
    visit '/locations/new'

    page.should have_content('Create A New Location')

    fill_in "City", with: "ExampleCity"
    fill_in "Province", with: "ExampleProvince"
    fill_in "Information", with: "ExampleInformation"
    fill_in "Xcoordinate", with: "400"
    fill_in "Ycoordinate", with: "400"

    click_button "Create Location"

    page.should have_content('Location was successfully created.')
    page.should have_selector('title', text: "Code Pink")

    location = Location.where(:city => "ExampleCity").first

    location.should_not be_nil
    location.city.should == "ExampleCity"
    location.province.should == "ExampleProvince"
    location.information.should == "ExampleInformation"
    location.xcoordinate.should == 400
    location.ycoordinate.should == 400

  end
end