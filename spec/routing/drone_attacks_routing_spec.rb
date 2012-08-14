require "spec_helper"

describe DroneAttacksController do
  describe "routing" do

    it "routes to #index" do
      get("/drone_attacks").should route_to("drone_attacks#index")
    end

    it "routes to #new" do
      get("/drone_attacks/new").should route_to("drone_attacks#new")
    end

    it "routes to #show" do
      get("/drone_attacks/1").should route_to("drone_attacks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/drone_attacks/1/edit").should route_to("drone_attacks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/drone_attacks").should route_to("drone_attacks#create")
    end

    it "routes to #update" do
      put("/drone_attacks/1").should route_to("drone_attacks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/drone_attacks/1").should route_to("drone_attacks#destroy", :id => "1")
    end

  end
end
