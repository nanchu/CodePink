require 'spec_helper'

describe "Creating New Publisher" do

  it"should be able to create new publisher via 'publishers/new'" do
    visit '/publishers/new'

    page.should have_content('Create A New Publisher')

    fill_in "Name", with: "ExampleName"

    click_button "Create Publisher"

    page.should have_content('publisher was successfully created.')
    page.should have_selector('title', text: "Code Pink")

    publisher = Publisher.where(:name => "ExampleName").first

    publisher.should_not be_nil
    publisher.name.should == "ExampleName"

  end
end