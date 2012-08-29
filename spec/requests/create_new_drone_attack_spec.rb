require 'spec_helper'

describe "Creating New Drone Attacks" do

  it"should visit 'drone_attacks/new'" do
    visit '/drone_attacks/new'

    page.should have_content('Create A New Drone Attack')

    fill_in "Incident year", with: "2222"
    fill_in "Incident date", with: "2222"
    fill_in "Display date", with: "2004"
    fill_in "Al qaida min", with: "9"
    fill_in "Al qaida max", with: "9"
    fill_in "Taliban min", with: "9"
    fill_in "Taliban max", with: "9"
    fill_in "Civilians min", with: "9"
    fill_in "Civilians max", with: "9"
    fill_in "Forigeners min", with: "9"
    fill_in "Forigeners max", with: "9"
    fill_in "Total died min", with: "9"
    fill_in "Total died max", with: "9"
    fill_in "Injured min", with: "9"
    fill_in "Injured max", with: "9"
    fill_in "URL", with: "www.google.com"

    #click_button "Create Drone attack"

    page.should have_selector('title', text: "Code Pink")
  end
end
