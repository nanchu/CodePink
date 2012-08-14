require 'spec_helper'

describe "DroneAttacks" do
  describe "GET /drone_attacks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get drone_attacks_path
      response.status.should be(200)
    end
  end
end
