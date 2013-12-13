require "spec_helper"

describe ArtsController do
  describe "routing" do

    it "routes to #index" do
      get("/arts").should route_to("arts#index")
    end

    it "routes to #new" do
      get("/arts/new").should route_to("arts#new")
    end

    it "routes to #show" do
      get("/arts/1").should route_to("arts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/arts/1/edit").should route_to("arts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/arts").should route_to("arts#create")
    end

    it "routes to #update" do
      put("/arts/1").should route_to("arts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/arts/1").should route_to("arts#destroy", :id => "1")
    end

  end
end
