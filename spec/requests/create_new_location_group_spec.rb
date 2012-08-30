require 'spec_helper'

describe "Creating New Location Group" do

  it"should be able to create new location group via 'location_groups/new'" do
    visit '/location_groups/new'

    page.should have_content('Create A New Location Group')

    fill_in "Name", with: "ExampleLocationGroupName"
    fill_in "Xcoordinate", with: "300"
    fill_in "Ycoordinate", with: "300"

    click_button "Create Location group"

    page.should have_content('Location group was successfully created.')
    page.should have_selector('title', text: "Code Pink")

    location_group = LocationGroup.where(:name => "ExampleLocationGroupName").first

    location_group.should_not be_nil
    location_group.name.should == "ExampleLocationGroupName"
    location_group.xcoordinate.should == 300
    location_group.ycoordinate.should == 300

  end
end