require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path}

    describe "with invalid info" do
      before { click_button "Sign in"}

      it { should have_selector('h1', text: 'Sign in')}
    end

    describe "with valid info" do
      let(:user) { FactoryGirl.create(:user)}
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_selector('h1', text: 'Locations')}

      describe "follwed by signout" do
        before { click_link "Sign out"}
        it { should have_link('Sign in')}
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Locations conrtoller" do
        let(:location) { FactoryGirl.create(:location)}

        describe "visiting the Locations#edit page" do
          before { visit edit_location_path(location) }
          it { should have_selector('h1', text: "Sign in")}
        end

        describe "submitting to the update action" do
          before { put location_path(location) }
          specify { response.should redirect_to(signin_path)}
        end

        describe "deleting a location" do
          before { delete location_path(location)}
          specify { response.should redirect_to(signin_path)}
        end

        describe "creating new location" do
          before { post locations_path(location)}
          specify { response.should redirect_to(signin_path)}
        end
      end

      describe "in the Drone Attacks controller" do
        let(:drone_attack) { FactoryGirl.create(:drone_attack)}

        describe "visiting the DroneAttacks#edit page" do
          before { visit edit_drone_attack_path(drone_attack) }
          it { should have_selector('h1', text: "Sign in")}
        end

        describe "submitting to the update action" do
          before { put drone_attack_path(drone_attack) }
          specify { response.should redirect_to(signin_path)}
        end

        describe "deleting a drone_attack" do
          before { delete drone_attack_path(drone_attack)}
          specify { response.should redirect_to(signin_path)}
        end

        describe "creating new drone_attack" do
          before { post drone_attacks_path(drone_attack)}
          specify { response.should redirect_to(signin_path)}
        end
      end

      describe "in the LocationGroup controller" do
        let(:location_group) { FactoryGirl.create(:location_group)}

        describe "visiting the LocationGroups#edit page" do
          before { visit edit_location_group_path(location_group) }
          it { should have_selector('h1', text: "Sign in")}
        end

        describe "submitting to the update action" do
          before { put location_group_path(location_group) }
          specify { response.should redirect_to(signin_path)}
        end

        describe "deleting a location_group" do
          before { delete location_group_path(location_group)}
          specify { response.should redirect_to(signin_path)}
        end

        describe "creating new location_group" do
          before { post location_groups_path(location_group)}
          specify { response.should redirect_to(signin_path)}
        end
      end

      describe "in the Publishers controller" do
        let(:publisher) { FactoryGirl.create(:publisher)}

        describe "visiting the Publishers#edit page" do
          before { visit edit_publisher_path(publisher) }
          it { should have_selector('h1', text: "Sign in")}
        end

        describe "submitting to the update action" do
          before { put publisher_path(publisher) }
          specify { response.should redirect_to(signin_path)}
        end

        describe "deleting a publisher" do
          before { delete publisher_path(publisher)}
          specify { response.should redirect_to(signin_path)}
        end

        describe "creating new publisher" do
          before { post publishers_path(publisher)}
          specify { response.should redirect_to(signin_path)}
        end
      end

      describe "in the Publishers controller" do
        let(:publisher) { FactoryGirl.create(:publisher)}

        describe "visiting the Publishers#edit page" do
          before { visit edit_publisher_path(publisher) }
          it { should have_selector('h1', text: "Sign in")}
        end

        describe "submitting to the update action" do
          before { put publisher_path(publisher) }
          specify { response.should redirect_to(signin_path)}
        end

        describe "deleting a publisher" do
          before { delete publisher_path(publisher)}
          specify { response.should redirect_to(signin_path)}
        end

        describe "creating new publisher" do
          before { post publishers_path(publisher)}
          specify { response.should redirect_to(signin_path)}
        end
      end

      describe "in the Users controller" do
        let(:user) { FactoryGirl.create(:user)}

        describe "visiting the Users#edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('h1', text: "Sign in")}
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path)}
        end

        describe "deleting a user" do
          before { delete user_path(user)}
          specify { response.should redirect_to(signin_path)}
        end

        describe "creating new user" do
          before { post users_path(user)}
          specify { response.should redirect_to(signin_path)}
        end
      end
    end
  end
end
