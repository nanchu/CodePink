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
end
