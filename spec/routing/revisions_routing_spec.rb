require "spec_helper"

describe RevisionsController do
  describe "routing" do

    it "routes to #index" do
      get("/revisions").should route_to("revisions#index")
    end

    it "routes to #new" do
      get("/revisions/new").should route_to("revisions#new")
    end

    it "routes to #show" do
      get("/revisions/1").should route_to("revisions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/revisions/1/edit").should route_to("revisions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/revisions").should route_to("revisions#create")
    end

    it "routes to #update" do
      put("/revisions/1").should route_to("revisions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/revisions/1").should route_to("revisions#destroy", :id => "1")
    end

  end
end
